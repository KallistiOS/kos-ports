TARGET = liboggvorbisplay.a
OBJS = liboggvorbisplay/main.o liboggvorbisplay/sndoggvorbis.o
# Use installed Ogg headers instead of the legacy copies in include/ogg.
KOS_CFLAGS += -iquote include -Iliboggvorbisplay

include ${KOS_PORTS}/scripts/lib.mk
