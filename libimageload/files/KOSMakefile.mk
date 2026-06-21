TARGET = libimageload.a
OBJS = readpcx.o readbmp.o readjpeg.o imageload.o jitter.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
