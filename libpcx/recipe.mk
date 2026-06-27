# Port Metadata
libpcx_PORTVERSION =       2.0.0

libpcx_MAINTAINER =        Nobody
libpcx_LICENSE =           KOS License
libpcx_SHORT_DESC =        Library for decoding PCX images

# What files we need to download, and where from.
libpcx_GIT_HASH =          aa03fe15107bec480e0dcad0a6d40933e740f8b4
libpcx_DOWNLOAD_SITE =     https://github.com/KallistiOS/libpcx/archive/
libpcx_DOWNLOAD_FILE =     ${libpcx_GIT_HASH}.tar.gz

libpcx_TARGET =            libpcx.a
libpcx_INSTALLED_HDRS =    include/pcx.h
libpcx_HDR_INSTDIR =       pcx
