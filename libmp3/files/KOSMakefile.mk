TARGET = libmp3.a
SUBDIRS = xingmp3 libmp3
LIB_OBJS = build/*.o

include ${KOS_PORTS}/scripts/lib.mk

$(LIB_OBJS): CPPFLAGS += -Iinclude

$(LIB_OBJS): CFLAGS += -std=c17
