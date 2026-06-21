TARGET = libkosh.a
OBJS = kosh.o builtin.o chdir.o input.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
