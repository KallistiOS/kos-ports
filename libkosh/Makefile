# Port Metadata
PORTNAME =          libkosh
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        The KallistiOS shell (library)
ARCHS_SUPPORTED =   dreamcast

DEPENDENCIES =      libconio

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libkosh \
                    https://github.com/KallistiOS/libkosh.git

TARGET =            libkosh.a
INSTALLED_HDRS =    include/kosh.h
HDR_INSTDIR =       kosh

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
