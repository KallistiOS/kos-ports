TARGET = libmpeg.a
OBJS = mpeg.o
KOS_CFLAGS += -Iinclude

include ${KOS_PORTS}/scripts/lib.mk
