# Port Metadata
PORTNAME =          zlib
PORTVERSION =       1.3.2

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           zlib License - http://opensource.org/licenses/Zlib
SHORT_DESC =        Lossless data compression library

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     http://zlib.net
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libz.a
INSTALLED_HDRS =    zlib.h zconf.h

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk kos_zlib.c

# Set zconf.h to match the flags we build libz.a with
PREBUILD =          zlib_prebuild

include ${KOS_PORTS}/scripts/kos-ports.mk
zlib_prebuild:
	cd "build/${PORTNAME}-${PORTVERSION}" && \
	sed -e 's|^#if HAVE_UNISTD_H-0|#if 1|' \
	    -e 's|^#if HAVE_STDARG_H-0|#if 1|' \
	    zconf.h > zconf.h.new && mv zconf.h.new zconf.h
