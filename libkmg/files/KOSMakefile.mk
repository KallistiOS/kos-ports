TARGET = libkmg.a
OBJS = kmg.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
