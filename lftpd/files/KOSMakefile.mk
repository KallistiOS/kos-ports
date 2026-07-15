TARGET = liblftpd.a
OBJS = lftpd.o lftpd_inet.o lftpd_io.o lftpd_log.o lftpd_string.o

include ${KOS_PORTS}/lib.mk

$(OBJS): CPPFLAGS += -Iinclude -I.
