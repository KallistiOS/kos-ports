# Port Metadata
PORTNAME =		libmpeg
PORTVERSION =	1.0.0

MAINTAINER =	Andy Barajas
LICENSE =		MIT LICENSE
SHORT_DESC =	Library for decoding MPEG1 Video, MP2 Audio using pl_mpeg

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     https://github.com/Dreamcast-Projects/pl_mpeg/archive/refs/tags
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =		    libmpeg.a
INSTALLED_HDRS =	mpeg.h
HDR_INSTDIR =		mpeg
DISTFILE_DIR =      pl_mpeg-${PORTNAME}-${PORTVERSION}

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =		KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
