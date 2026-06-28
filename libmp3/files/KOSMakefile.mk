TARGET = libmp3.a
SUBDIRS = xingmp3 libmp3
LIB_OBJS = cdct.o csbt.o cupl3.o cup.o cwinm.o dec8.o hwin.o icdct.o isbt.o \
	   iup.o iwinm.o l3dq.o l3init.o main.o mdct.o mhead.o msis.o \
	   sndmp3.o uph.o upsf.o

OBJS = $(addprefix build/,${LIB_OBJS})

include ${KOS_PORTS}/lib.mk
