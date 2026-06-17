# Port Metadata
PORTNAME =          libtga
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        Library for decoding TGA images
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libtga \
                    https://github.com/KallistiOS/libtga.git

TARGET =            libtga.a
INSTALLED_HDRS =    include/tga.h
HDR_INSTDIR =       tga

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
