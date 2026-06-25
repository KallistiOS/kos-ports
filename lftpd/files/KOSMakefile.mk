TARGET = liblftpd.a
OBJS = lftpd.o lftpd_inet.o lftpd_io.o lftpd_log.o lftpd_string.o
KOS_CFLAGS += -Iinclude -I.

include ${KOS_PORTS}/scripts/lib.mk
