TARGET = libmpeg.a
OBJS = mpeg.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
