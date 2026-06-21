TARGET = libtremor.a
OBJS = mdct.o dsp.o info.o misc.o floor1.o floor0.o vorbisfile.o res012.o \
       mapping0.o codebook.o framing.o bitwise.o floor_lookup.o main.o \
	   sndoggvorbis.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -DPACKAGE="libvorbisidec" -DVERSION="1.3.0" -DHAVE_DLFCN_H=1 -I. -D_REENTRANT

$(OBJS): CFLAGS += -fsigned-char -ffast-math
