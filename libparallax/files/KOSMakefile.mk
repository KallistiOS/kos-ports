TARGET = libparallax.a
OBJS := $(patsubst %.c,%.o,$(wildcard src/*.c))

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude -I ${KOS_SYSROOT}/include/libpng16
