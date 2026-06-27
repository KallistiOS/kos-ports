TARGET = libkmg.a
OBJS = kmg.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
