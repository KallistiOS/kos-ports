TARGET = liboggvorbisplay.a
OBJS = liboggvorbisplay/main.o liboggvorbisplay/sndoggvorbis.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude -Iliboggvorbisplay
