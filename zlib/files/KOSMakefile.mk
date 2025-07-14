TARGET = libz.a
OBJS = adler32.o compress.o crc32.o deflate.o gzclose.o gzlib.o gzread.o gzwrite.o \
       infback.o inffast.o inflate.o inftrees.o trees.o uncompr.o zutil.o kos_zlib.o

KOS_CFLAGS += -I. -DHAVE_UNISTD_H -DHAVE_STDARG_H

include ${KOS_PORTS}/scripts/lib.mk
