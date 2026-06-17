# Port Metadata
PORTNAME =          libkmg
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        Library for decoding KMG images
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libkmg \
                    https://github.com/KallistiOS/libkmg.git

TARGET =            libkmg.a
INSTALLED_HDRS =    include/kmg.h
HDR_INSTDIR =       kmg

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
