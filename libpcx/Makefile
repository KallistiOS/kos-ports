# Port Metadata
PORTNAME =          libpcx
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        Library for decoding PCX images
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libpcx \
                    https://github.com/KallistiOS/libpcx.git

TARGET =            libpcx.a
INSTALLED_HDRS =    include/pcx.h
HDR_INSTDIR =       pcx

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
