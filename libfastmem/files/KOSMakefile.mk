TARGET = libfastmem.a
OBJS = memcpy_fast.o memset_fast.o memmove_fast.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
