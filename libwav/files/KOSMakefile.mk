TARGET = libwav.a
OBJS = libwav.o sndwav.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
