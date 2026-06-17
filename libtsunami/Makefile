# Port Metadata
PORTNAME =          libtsunami
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        C++ "scene graph" wrapper around libparallax
ARCHS_SUPPORTED =   dreamcast

DEPENDENCIES =      libparallax

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libtsunami \
                    https://github.com/KallistiOS/libtsunami.git

TARGET =            libtsunami.a
HDR_DIRECTORY =     include
HDR_INSTDIR =       tsu

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
