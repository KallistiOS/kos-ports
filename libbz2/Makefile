# Port Metadata
PORTNAME = 			libbz2
PORTVERSION = 		1.0.6

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           BSD-like (see LICENSE in the source distribution)
SHORT_DESC =        Block-sorting compression library

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
# ~CA~ 8.16.18 - bzip.org is down, now points to an unofficial mirror on Github; verified distinfo matches.
DOWNLOAD_SITE = 	https://github.com/nemequ/bzip2/releases/download/v1.0.6/${PORTVERSION}
DOWNLOAD_FILES = 	bzip2-${PORTVERSION}.tar.gz

TARGET =			libbz2.a
INSTALLED_HDRS =	bzlib.h
HDR_INSTDIR =       bzlib
DISTFILE_DIR =      bzip2-${PORTVERSION}

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =		KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
