# Port Metadata
PORTNAME =          libparallax
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        Simple (mostly 2D) game API library
ARCHS_SUPPORTED =   dreamcast

DEPENDENCIES =      libpng libjpeg libkmg

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libparallax \
                    https://github.com/KallistiOS/libparallax.git

TARGET =            libparallax.a
INSTALLED_HDRS =    include/color.h include/context.h include/dr.h \
                    include/font.h include/list.h include/matrix.h \
                    include/prim.h include/sprite.h include/texture.h
HDR_INSTDIR =       plx

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
