TARGET = libdcplib.a
OBJS = ulError.o sg.o fnt.o fntTXF.o sgd.o sgIsect.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude
