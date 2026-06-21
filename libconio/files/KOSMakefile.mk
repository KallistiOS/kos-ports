TARGET = libconio.a
OBJS = conio.o draw.o input.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CFLAGS += -Iinclude -DBUILD_LIBCONIO -DGFX
