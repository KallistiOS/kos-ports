TARGET = libdcplib.a
OBJS = ulError.o sg.o fnt.o fntTXF.o sgd.o sgIsect.o

include ${KOS_PORTS}/scripts/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
