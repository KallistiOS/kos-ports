# Port Metadata
PORTNAME    =       mpg123
PORTVERSION =       1.32.10

MAINTAINER  =       Donald Haase
LICENSE     =       LGPL 2.1
SHORT_DESC  =       Fast console MPEG Audio Player and decoder library.

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD      =        autotools

# Don't attempt to copy the target library, it will be in the inst dir already.
NOCOPY_TARGET   =     1

# Pulling from the Audacity maintained version.
DOWNLOAD_SITES =    https://mpg123.de/download/
DOWNLOAD_FILES =    mpg123-${PORTVERSION}.tar.bz2

TARGET          =   lib${PORTNAME}.a

CONFIGURE_ARGS = --enable-static --enable-components=no --enable-libmpg123

MAKE_TARGET     =   all install

include ${KOS_PORTS}/scripts/kos-ports.mk
