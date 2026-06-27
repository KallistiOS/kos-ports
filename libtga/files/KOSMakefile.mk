TARGET = libtga.a
OBJS = tga.o tga_texture.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
