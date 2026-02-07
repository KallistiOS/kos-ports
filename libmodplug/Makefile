# Port Metadata
PORTNAME =          libmodplug
PORTVERSION =       0.7

MAINTAINER =        Nobody
LICENSE =           Public Domain
SHORT_DESC =        A library for MOD-like tracker music formats
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libmodplug \
                    https://github.com/KallistiOS/libmodplug.git

TARGET =            libmodplug.a
INSTALLED_HDRS =    include/modplug.h include/sndfile.h include/stdafx.h
HDR_INSTDIR =       modplug

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
