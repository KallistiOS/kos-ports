TARGET = libwav.a
OBJS = libwav.o sndwav.o
KOS_CFLAGS += -Iinclude

include ${KOS_PORTS}/scripts/lib.mk
