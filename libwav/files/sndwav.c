
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

#include <kos/thread.h>
#include <dc/sound/stream.h>

#include "sndwav.h"
#include "libwav.h"

/* Keep track of things from the Driver side */
#define SNDDRV_STATUS_NULL         0x00
#define SNDDRV_STATUS_READY        0x01
#define SNDDRV_STATUS_DONE         0x02

/* Keep track of things from the Decoder side */
#define SNDDEC_STATUS_NULL         0x00
#define SNDDEC_STATUS_READY        0x01
#define SNDDEC_STATUS_STREAMING    0x02
#define SNDDEC_STATUS_PAUSING      0x03
#define SNDDEC_STATUS_STOPPING     0x04
#define SNDDEC_STATUS_RESUMING     0x05

typedef void *(*snddrv_cb)(snd_stream_hnd_t, int, int*);

typedef struct {
    /* The buffer on the AICA side */
    snd_stream_hnd_t shnd;

    /* We either read the wav data from a file or 
       we read from a buffer */
    file_t wave_file;
    const uint8_t *wave_buf;

    /* Contains the buffer that we are going to send
       to the AICA in the callback.  Should be 32-byte
       aligned */
    uint8_t *drv_buf;

    /* Status of the stream that can be started, stopped
       paused, ready. etc */
    volatile int status;

    snddrv_cb callback;

    uint32_t loop;
    uint32_t vol;         /* 0-255 */

    uint32_t format;      /* Wave format */
    uint32_t channels;    /* 1-Mono/2-Stereo */
    uint32_t sample_rate; /* 44100Hz */
    uint32_t sample_size; /* 4/8/16-Bit */

    /* Offset into the file or buffer where the audio 
       data starts */
    uint32_t data_offset;

    /* The length of the audio data */
    uint32_t data_length;

    /* Used only in reading wav data from a buffer 
       and not a file */
    uint32_t buf_offset;  
   
} snddrv_hnd;

static snddrv_hnd streams[SND_STREAM_MAX];
static volatile int sndwav_status = SNDDRV_STATUS_NULL;

static void *sndwav_thread(void);
static void *wav_file_callback(snd_stream_hnd_t hnd, int req, int *done);
static void *wav_buf_callback(snd_stream_hnd_t hnd, int req, int *done);

int wav_init(void) {
    int i;

    if(snd_stream_init() < 0)
        return 0;

    for(i = 0; i < SND_STREAM_MAX; i++) {
        streams[i].shnd = SND_STREAM_INVALID;
        streams[i].vol = 240;
        streams[i].status = SNDDEC_STATUS_NULL;
        streams[i].callback = NULL;
    }

    if(thd_create(1, sndwav_thread, NULL) != NULL) {
        sndwav_status = SNDDRV_STATUS_READY;
        return 1;
	}
    else {
        return 0;
    }
}

void wav_shutdown(void) {
    int i;

    sndwav_status = SNDDRV_STATUS_DONE;
    for(i = 0; i < SND_STREAM_MAX; i++) {
        wav_destroy(i);
    }
}

void wav_destroy(wav_stream_hnd_t hnd) {
    if(streams[hnd].shnd == SND_STREAM_INVALID)
        return;

    if(streams[hnd].wave_file != FILEHND_INVALID)
        fs_close(streams[hnd].wave_file);

    if(streams[hnd].drv_buf) {
        free(streams[hnd].drv_buf);
        streams[hnd].drv_buf = NULL;
    }

    snd_stream_stop(streams[hnd].shnd);
    snd_stream_destroy(streams[hnd].shnd);
    
    streams[hnd].shnd = SND_STREAM_INVALID;
    streams[hnd].vol = 240;
    streams[hnd].status = SNDDEC_STATUS_NULL;
    streams[hnd].callback = NULL;
}

wav_stream_hnd_t wav_create(const char *filename, int loop) {
    int fn_len;
    file_t file;
    WavFileInfo info;
    wav_stream_hnd_t index;

    if(filename == NULL)
        return SND_STREAM_INVALID;

    file = fs_open(filename, O_RDONLY);

    if(file == FILEHND_INVALID)
        return SND_STREAM_INVALID;

    index = snd_stream_alloc(wav_file_callback, SND_STREAM_BUFFER_MAX);

    if(index == SND_STREAM_INVALID) {
        fs_close(file);
        snd_stream_destroy(index);
        return SND_STREAM_INVALID;
    }

    fn_len = strlen(filename);

    if(filename[fn_len - 3] == 'r' && filename[fn_len - 1] == 'w') {
        wav_get_info_cdda(file, &info);
    }
    else if(!wav_get_info_file(file, &info)) {
        fs_close(file);
        snd_stream_destroy(index);
        return SND_STREAM_INVALID;
    }

    streams[index].drv_buf = memalign(32, SND_STREAM_BUFFER_MAX);

    if(streams[index].drv_buf == NULL) {
        fs_close(file);
        snd_stream_destroy(index);
        return SND_STREAM_INVALID;
    }

    streams[index].shnd = index;
    streams[index].wave_file = file;
    streams[index].loop = loop;
    streams[index].callback = wav_file_callback;

    streams[index].format = info.format;
    streams[index].channels = info.channels;
    streams[index].sample_rate = info.sample_rate;
    streams[index].sample_size = info.sample_size;
    streams[index].data_length = info.data_length;
    streams[index].data_offset = info.data_offset;
    
    fs_seek(streams[index].wave_file, streams[index].data_offset, SEEK_SET);
    streams[index].status = SNDDEC_STATUS_READY;
    
    return index;
}

wav_stream_hnd_t wav_create_fd(file_t file, int loop) {
    WavFileInfo info;
    wav_stream_hnd_t index;

    if(file == FILEHND_INVALID)
        return SND_STREAM_INVALID;

    index = snd_stream_alloc(wav_file_callback, SND_STREAM_BUFFER_MAX);

    if(index == SND_STREAM_INVALID) {
        fs_close(file);
        snd_stream_destroy(index);
        return SND_STREAM_INVALID;
    }
    
    if(!wav_get_info_file(file, &info)) {
        fs_close(file);
        snd_stream_destroy(index);
        return SND_STREAM_INVALID;
    }

    streams[index].drv_buf = memalign(32, SND_STREAM_BUFFER_MAX);

    if(streams[index].drv_buf == NULL) {
        fs_close(file);
        snd_stream_destroy(index);
        return SND_STREAM_INVALID;
    }

    streams[index].shnd = index;
    streams[index].wave_file = file;
    streams[index].loop = loop;
    streams[index].callback = wav_file_callback;

    streams[index].format = info.format;
    streams[index].channels = info.channels;
    streams[index].sample_rate = info.sample_rate;
    streams[index].sample_size = info.sample_size;
    streams[index].data_length = info.data_length;
    streams[index].data_offset = info.data_offset;
    
    fs_seek(streams[index].wave_file, streams[index].data_offset, SEEK_SET);
    streams[index].status = SNDDEC_STATUS_READY;
    
    return index;
}

wav_stream_hnd_t wav_create_buf(const uint8_t *buf, int loop) {
    WavFileInfo info;
    wav_stream_hnd_t index;

    if(buf == NULL)
        return SND_STREAM_INVALID;

    index = snd_stream_alloc(wav_file_callback, SND_STREAM_BUFFER_MAX); // SND_STREAM_BUFFER_MAX/4

    if(index == SND_STREAM_INVALID) {
        snd_stream_destroy(index);
        return SND_STREAM_INVALID;
    }
    
    if(!wav_get_info_buffer(buf, &info)) {
        snd_stream_destroy(index);
        return SND_STREAM_INVALID;
    }

    streams[index].drv_buf = memalign(32, SND_STREAM_BUFFER_MAX);

    if(streams[index].drv_buf == NULL) {
        snd_stream_destroy(index);
        return SND_STREAM_INVALID;
    }

    streams[index].shnd = index;
    streams[index].wave_buf = buf;
    streams[index].loop = loop;
    streams[index].callback = wav_buf_callback;

    streams[index].format = info.format;
    streams[index].channels = info.channels;
    streams[index].sample_rate = info.sample_rate;
    streams[index].sample_size = info.sample_size;
    streams[index].data_length = info.data_length;
    streams[index].data_offset = info.data_offset;
    
    streams[index].buf_offset = info.data_offset;
    streams[index].status = SNDDEC_STATUS_READY;

    return index;
}

void wav_play(wav_stream_hnd_t hnd) {
    if(streams[hnd].status == SNDDEC_STATUS_STREAMING)
       return;

    streams[hnd].status = SNDDEC_STATUS_RESUMING;
}

void wav_pause(wav_stream_hnd_t hnd) {
    if(streams[hnd].status == SNDDEC_STATUS_READY ||
       streams[hnd].status == SNDDEC_STATUS_PAUSING)
       return;
       
    streams[hnd].status = SNDDEC_STATUS_PAUSING;
}

void wav_stop(wav_stream_hnd_t hnd) {
    if(streams[hnd].status == SNDDEC_STATUS_READY ||
       streams[hnd].status == SNDDEC_STATUS_STOPPING)
       return;
       
    streams[hnd].status = SNDDEC_STATUS_STOPPING;
}

void wav_volume(wav_stream_hnd_t hnd, int vol) {
    if(streams[hnd].shnd == SND_STREAM_INVALID)
        return;

    if(vol > 255)
        vol = 255;

    if(vol < 0)
        vol = 0;

    streams[hnd].vol = vol;
    snd_stream_volume(streams[hnd].shnd, streams[hnd].vol);
}

int wav_isplaying(wav_stream_hnd_t hnd) {
    return streams[hnd].status == SNDDEC_STATUS_STREAMING;
}

void wav_add_filter(wav_stream_hnd_t hnd, wav_filter filter, void *obj) {
    snd_stream_filter_add(streams[hnd].shnd, filter, obj);
}

void wav_remove_filter(wav_stream_hnd_t hnd, wav_filter filter, void *obj) {
    snd_stream_filter_remove(streams[hnd].shnd, filter, obj);
}

static void *sndwav_thread(void) {
    int i;

    while(sndwav_status != SNDDRV_STATUS_DONE) {
        for(i = 0; i < SND_STREAM_MAX; i++) {
            switch(streams[i].status) {
                case SNDDEC_STATUS_READY:
                    break;
                case SNDDEC_STATUS_RESUMING:
                    if(streams[i].sample_size == 16) {
                        snd_stream_start(streams[i].shnd, streams[i].sample_rate, streams[i].channels - 1);
                    } else if(streams[i].sample_size == 8) {
                        snd_stream_start_pcm8(streams[i].shnd, streams[i].sample_rate, streams[i].channels - 1);
                    } else if(streams[i].sample_size == 4) {
                        snd_stream_start_adpcm(streams[i].shnd, streams[i].sample_rate, streams[i].channels - 1);
                    }
                    streams[i].status = SNDDEC_STATUS_STREAMING;
                    break;
                case SNDDEC_STATUS_PAUSING:
                    snd_stream_stop(streams[i].shnd);
                    streams[i].status = SNDDEC_STATUS_READY;
                    break;
                case SNDDEC_STATUS_STOPPING:
                    snd_stream_stop(streams[i].shnd);
                    if(streams[i].wave_file != FILEHND_INVALID)
                        fs_seek(streams[i].wave_file, streams[i].data_offset, SEEK_SET);
                    else
                        streams[i].buf_offset = streams[i].data_offset;
                    
                    streams[i].status = SNDDEC_STATUS_READY;
                    break;
                case SNDDEC_STATUS_STREAMING:
                    snd_stream_poll(streams[i].shnd);
                    thd_sleep(20);
                    break;
            }
        }
    }

    return NULL;
}

static void *wav_file_callback(snd_stream_hnd_t hnd, int req, int* done) {
    int read = fs_read(streams[hnd].wave_file, streams[hnd].drv_buf, req);

    if(read != req) {
        fs_seek(streams[hnd].wave_file, streams[hnd].data_offset, SEEK_SET);
        if(streams[hnd].loop) {
            fs_read(streams[hnd].wave_file, streams[hnd].drv_buf, req);
        }
        else {
            snd_stream_stop(streams[hnd].shnd);
            streams[hnd].status = SNDDEC_STATUS_READY;
            return NULL;
        }
    }

    *done = req;

    return streams[hnd].drv_buf;
}

static void *wav_buf_callback(snd_stream_hnd_t hnd, int req, int* done) {
    if((streams[hnd].data_length-(streams[hnd].buf_offset - streams[hnd].data_offset)) >= req)
        memcpy(streams[hnd].drv_buf, streams[hnd].wave_buf+streams[hnd].buf_offset, req);
    else {
        streams[hnd].buf_offset = streams[hnd].data_offset;
        if(streams[hnd].loop) {
            memcpy(streams[hnd].drv_buf, streams[hnd].wave_buf+streams[hnd].buf_offset, req);
        }
        else {
            snd_stream_stop(streams[hnd].shnd);
            streams[hnd].status = SNDDEC_STATUS_READY;
            return NULL;
        }
    }

    streams[hnd].buf_offset += *done = req;

    return streams[hnd].drv_buf;
}
