# Port Metadata
PORTNAME =          libmp3
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           GPLv2+ (XingMP3) and KOS License (KOS Glue)
SHORT_DESC =        Library for decoding and streaming MP3 audio
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libmp3 \
                    https://github.com/KallistiOS/libmp3.git

TARGET =            libmp3.a
INSTALLED_HDRS =    include/sndmp3.h include/sndserver.h
HDR_INSTDIR =       mp3

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
