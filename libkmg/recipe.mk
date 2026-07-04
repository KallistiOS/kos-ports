# Port Metadata
libkmg_PORTVERSION =       2.0.0

libkmg_MAINTAINER =        Nobody
libkmg_LICENSE =           KOS License
libkmg_SHORT_DESC =        Library for decoding KMG images

# What files we need to download, and where from.
libkmg_GIT_REPO =          https://github.com/KallistiOS/libkmg
libkmg_GIT_HASH =          d3c82b9bc82bb27cc3b1bb0bfbbb421e4315b6cf
libkmg_DOWNLOAD_URL =      ${libkmg_GIT_REPO}/archive/${libkmg_GIT_HASH}.tar.gz

libkmg_TARGET =            libkmg.a
libkmg_INSTALLED_HDRS =    include/kmg.h
libkmg_HDR_INSTDIR =       kmg
