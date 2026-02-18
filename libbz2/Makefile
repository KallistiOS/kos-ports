# Port Metadata
PORTNAME =          libbz2
PORTVERSION =       1.0.8

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           BSD-like (see LICENSE in the source distribution)
SHORT_DESC =        Block-sorting compression library
ARCHS_SUPPORTED =   dreamcast gamecube

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     http://cdn-fastly.deb.debian.org/debian/pool/main/b/bzip2/
DOWNLOAD_FILES =    bzip2_1.0.8.orig.tar.gz

TARGET =            libbz2.a
INSTALLED_HDRS =    bzlib.h
HDR_INSTDIR =       bzlib
DISTFILE_DIR =      bzip2-${PORTVERSION}

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
