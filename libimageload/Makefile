# Port Metadata
PORTNAME =          libimageload
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        Library for decoding BMP, JPEG, and PCX images
ARCHS_SUPPORTED =   dreamcast

DEPENDENCIES =      libjpeg

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libimageload \
                    https://github.com/KallistiOS/libimageload.git

TARGET =            libimageload.a
INSTALLED_HDRS =    include/imageload.h include/jitterdefs.h
HDR_INSTDIR =       imageload

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
