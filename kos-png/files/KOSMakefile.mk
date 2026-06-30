TARGET = libkos-png.a
OBJS = kos_img.o kos_texture.o readpng.o writepng.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CFLAGS += -I. -I${KOS_PORTS}/sysroot/include/libpng16
