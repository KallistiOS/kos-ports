TARGET = libfastmem.a
OBJS = memcpy_fast.o memset_fast.o memmove_fast.o
KOS_CFLAGS += -Iinclude

include ${KOS_PORTS}/scripts/lib.mk
