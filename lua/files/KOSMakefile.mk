TARGET = liblua.a
OBJS = src/lapi.o src/lauxlib.o src/lbaselib.o src/lcode.o \
	src/lcorolib.o src/lctype.o src/ldblib.o src/ldebug.o \
	src/ldo.o src/ldump.o src/lfunc.o src/lgc.o src/linit.o \
	src/liolib.o src/llex.o src/lmathlib.o src/lmem.o \
	src/loadlib.o src/lobject.o src/lopcodes.o src/loslib.o \
	src/lparser.o src/lstate.o src/lstring.o src/lstrlib.o \
	src/ltable.o src/ltablib.o src/ltm.o src/lundump.o \
	src/lutf8lib.o src/lvm.o src/lzio.o

defaultall: fixconf $(OBJS) subdirs linklib

fixconf:
	sed -e 's/#define LUA_32BITS[[:space:]+]0/#define LUA_32BITS 1/' -ibak src/luaconf.h

KOS_CFLAGS += -Isrc

include ${KOS_PORTS}/scripts/lib.mk
