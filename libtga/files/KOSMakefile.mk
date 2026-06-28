TARGET = libtga.a
OBJS = tga.o tga_texture.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
