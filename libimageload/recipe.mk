# Port Metadata
libimageload_PORTVERSION =       2.0.0

libimageload_MAINTAINER =        Nobody
libimageload_LICENSE =           KOS License
libimageload_SHORT_DESC =        Library for decoding BMP, JPEG, and PCX images

libimageload_DEPENDENCIES =      libjpeg

# What files we need to download, and where from.
libimageload_GIT_HASH =          d77ceb46f196f1866515524ed6d814eb5108268a
libimageload_DOWNLOAD_URL =      https://github.com/KallistiOS/libimageload/archive/${libimageload_GIT_HASH}.tar.gz

libimageload_TARGET =            libimageload.a
libimageload_INSTALLED_HDRS =    include/imageload.h include/jitterdefs.h
libimageload_HDR_INSTDIR =       imageload
