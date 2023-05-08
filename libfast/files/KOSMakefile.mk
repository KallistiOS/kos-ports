TARGET = libfast.a
OBJS = memcpy_fast.o memset_fast.o memmove_fast.o
KOS_CFLAGS += -Iinclude

include ${KOS_PORTS}/scripts/lib.mk

# Override the default %.S rule from "Makefile.rules" (we want "kos-cc" instead
# of "kos-as").
%.o: %.S
	kos-cc $< -o $@
