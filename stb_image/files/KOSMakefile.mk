TARGET = libstb_image.a
OBJS = stb_image.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
