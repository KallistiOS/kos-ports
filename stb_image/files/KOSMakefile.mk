TARGET = libstb_image.a
OBJS = stb_image.o
KOS_CFLAGS += -Iinclude

include ${KOS_PORTS}/scripts/lib.mk
