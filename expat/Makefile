# Port Metadata
PORTNAME =          expat
PORTVERSION =       2.8.1

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           MIT (see COPYING in the source distribution)
SHORT_DESC =        A C library for parsing XML

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD =        autotools

# Don't attempt to copy the target library, it will be in the inst dir already.
NOCOPY_TARGET =     1

# No external dependencies.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     https://github.com/libexpat/libexpat/releases/download/R_2_8_1
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libexpat.a
HDR_INSTDIR =       expat
DISTFILE_DIR =      ${PORTNAME}-${PORTVERSION}

# Autotools setup work.
CONFIGURE_ARGS =
CONFIGURE_DEFS =    RANLIB=${KOS_RANLIB} AR=kos-ar
MAKE_TARGET =       all install

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =

include ${KOS_PORTS}/scripts/kos-ports.mk
