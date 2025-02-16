# Port Metadata
PORTNAME =          opusfile
PORTVERSION =       0.11

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           3-clause BSD (see COPYING in the source distribution)
SHORT_DESC =        Opus audio codec library high-level file access library

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD =        autotools

# This port requires opus and libogg
DEPENDENCIES =      opus libogg

# What files we need to download, and where from.
DOWNLOAD_SITE =     https://ftp.osuosl.org/pub/xiph/releases/opus
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libopusfile.a
INSTALLED_HDRS =    include/opusfile.h
HDR_INSTDIR =       opusfile

# Autotools setup work.
CONFIGURE_ARGS =    --enable-fixed-point --disable-http --disable-doc \
                    --prefix=$(KOS_PORTS)/opusfile/inst
CONFIGURE_DEFS =    DEPS_CFLAGS="-I$(KOS_PORTS)/include -I$(KOS_PORTS)/include/opus" \
                    DEPS_LIBS="-lopus -logg"
MAKE_TARGET =       libopusfile.la

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =

# Add a pre-install target to get the built library where we expect it.
PREINSTALL =        opusfile_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk
opusfile_preinstall:
	cp build/${PORTNAME}-${PORTVERSION}/.libs/${TARGET} build/${PORTNAME}-${PORTVERSION}
