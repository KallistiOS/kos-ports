TARGET = libkos-jpeg.a
OBJS = kos_img.o kos_texture.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -I.
