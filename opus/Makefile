# Port Metadata
PORTNAME =          opus
PORTVERSION =       1.3.1

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           3-clause BSD (see COPYING in the source distribution)
SHORT_DESC =        Opus audio codec library

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD =        autotools

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     https://ftp.osuosl.org/pub/xiph/releases/opus
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libopus.a
INSTALLED_HDRS =    include/opus.h include/opus_defines.h include/opus_types.h \
                    include/opus_custom.h include/opus_multistream.h
HDR_INSTDIR =       opus

# Autotools setup work.
CONFIGURE_ARGS =    --enable-fixed-point --disable-extra-programs --disable-doc \
                    --prefix=$(KOS_PORTS)/opus/inst
CONFIGURE_DEFS =
MAKE_TARGET =       libopus.la

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =

# Add a pre-install target to get the built library where we expect it.
PREINSTALL =        opus_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk
opus_preinstall:
	cp build/${PORTNAME}-${PORTVERSION}/.libs/${TARGET} build/${PORTNAME}-${PORTVERSION}
