TARGET = liboggvorbisplay.a
OBJS = liboggvorbisplay/main.o liboggvorbisplay/sndoggvorbis.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude -Iliboggvorbisplay
