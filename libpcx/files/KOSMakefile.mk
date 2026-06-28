TARGET = libpcx.a
OBJS = pcx.o pcx_texture.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
