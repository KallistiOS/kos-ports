# Port Metadata
PORTNAME =          libvorbis
PORTVERSION =       1.3.7

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           3-clause BSD (see COPYING in the source distribution)
SHORT_DESC =        Vorbis audio codec library (floating-point version)

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD =        autotools

DEPENDENCIES =      libogg

# What files we need to download, and where from.
DOWNLOAD_SITE =     https://ftp.osuosl.org/pub/xiph/releases/vorbis
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libvorbis.a
INSTALLED_HDRS =    include/vorbis/codec.h include/vorbis/vorbisenc.h \
                    include/vorbis/vorbisfile.h
HDR_INSTDIR =       vorbis

# Add a pre-install target to get the built library where we expect it.
# This, copied from opus, might be solvable by
# adding an equivalent to HDR_DIRECTORY for lib
PREINSTALL =        vorbis_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk
vorbis_preinstall:
	cp build/${PORTNAME}-${PORTVERSION}/lib/.libs/${TARGET} build/${PORTNAME}-${PORTVERSION}
