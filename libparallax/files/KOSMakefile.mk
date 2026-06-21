TARGET = libparallax.a
OBJS := $(patsubst %.c,%.o,$(wildcard src/*.c))

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude -I ${KOS_PORTS}/sysroot/include/libpng16
