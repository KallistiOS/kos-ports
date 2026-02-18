# Port Metadata
PORTNAME =          libogg
PORTVERSION =       1.3.5

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           3-clause BSD (see COPYING in the source distribution)
SHORT_DESC =        Multimedia container format access library
ARCHS_SUPPORTED =   dreamcast

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD =        autotools

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     https://ftp.osuosl.org/pub/xiph/releases/ogg
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libogg.a
INSTALLED_HDRS =    include/ogg/ogg.h include/ogg/os_types.h \
                    include/ogg/config_types.h
HDR_INSTDIR =       ogg

# Add a pre-install target to get the built library where we expect it.
# This, copied from opus, might be solvable by
# adding an equivalent to HDR_DIRECTORY for lib
PREINSTALL =        ogg_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk
ogg_preinstall:
	cp build/${PORTNAME}-${PORTVERSION}/src/.libs/${TARGET} build/${PORTNAME}-${PORTVERSION}
