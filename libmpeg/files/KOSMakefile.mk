TARGET = libmpeg.a
OBJS = mpeg.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
