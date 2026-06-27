TARGET = libKGL.a
OBJS =  gl-rgb.o gl-fog.o gl-sh4-light.o gl-light.o gl-clip.o gl-clip-arrays.o
OBJS += gl-arrays.o gl-pvr.o gl-matrix.o gl-api.o gl-texture.o glu-texture.o
OBJS += gl-framebuffer.o gl-cap.o gl-error.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CFLAGS += -ffast-math -O3

$(OBJS): CPPFLAGS += -Iinclude -DBUILD_LIBGL
