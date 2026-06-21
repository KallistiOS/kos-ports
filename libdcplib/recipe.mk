# Port Metadata
libdcplib_PORTVERSION =       2.0.0

libdcplib_MAINTAINER =        Nobody
libdcplib_LICENSE =           LGPLv2 (with embedded system exemption)
libdcplib_SHORT_DESC =        A portable game programming library

# What files we need to download, and where from.
libdcplib_GIT_HASH =          0553d0f1e04e4349668912255d9cb1cf9dcdd3a5
libdcplib_DOWNLOAD_SITE =     https://github.com/KallistiOS/libdcplib/archive/
libdcplib_DOWNLOAD_FILE =     ${libdcplib_GIT_HASH}.tar.gz

libdcplib_TARGET =            libdcplib.a
libdcplib_INSTALLED_HDRS =    include/fnt.h include/sg.h include/ul.h
libdcplib_HDR_INSTDIR =       dcplib
