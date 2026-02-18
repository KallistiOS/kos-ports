# Port Metadata
PORTNAME =          zlib
PORTVERSION =       1.3.2

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           zlib License - http://opensource.org/licenses/Zlib
SHORT_DESC =        Lossless data compression library
ARCHS_SUPPORTED =   dreamcast gamecube

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     http://zlib.net
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libz.a
INSTALLED_HDRS =    zlib.h zconf.h

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk kos_zlib.c

include ${KOS_PORTS}/scripts/kos-ports.mk
