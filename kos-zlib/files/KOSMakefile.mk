TARGET = libkos-zlib.a
OBJS = kos_zlib.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -DHAVE_UNISTD_H -DHAVE_STDARG_H
