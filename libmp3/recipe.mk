# Port Metadata
libmp3_PORTVERSION =       2.0.0

libmp3_MAINTAINER =        Nobody
libmp3_LICENSE =           GPLv2+ (XingMP3) and KOS License (KOS Glue)
libmp3_SHORT_DESC =        Library for decoding and streaming MP3 audio

# What files we need to download, and where from.
libmp3_GIT_HASH =          1a1360238f98a8dc2d91e752c366ffb8d24e41ff
libmp3_DOWNLOAD_SITE =     https://github.com/KallistiOS/libmp3/archive/
libmp3_DOWNLOAD_FILE =     ${libmp3_GIT_HASH}.tar.gz

libmp3_TARGET =            libmp3.a
libmp3_INSTALLED_HDRS =    include/sndmp3.h include/sndserver.h
libmp3_HDR_INSTDIR =       mp3
