TARGET = libwav.a
OBJS = libwav.o sndwav.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
