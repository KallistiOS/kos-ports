TARGET = libADX.a
OBJS = src/libadx.o src/snddrv.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
