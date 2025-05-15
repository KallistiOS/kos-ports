# Port Metadata
PORTNAME    =       taglib
PORTVERSION =       2.0.2

MAINTAINER  =       Donald Haase
LICENSE     =       LGPL 2.1
SHORT_DESC  =       TagLib is a library for reading and editing the meta-data of several popular audio formats.

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD      =        cmake

# Don't attempt to copy the target library, it will be in the inst dir already.
NOCOPY_TARGET   =     1

GIT_REPOSITORY =    https://github.com/taglib/taglib
GIT_BRANCH =        v${PORTVERSION}

TARGET          =   lib${PORTNAME}.a

#It triest to install a config file so toss that in ./build
CMAKE_ARGS = -DCMAKE_INSTALL_BINDIR=${KOS_PORTS}/${PORTNAME}/build/bin

MAKE_TARGET     =   all install

# Need to pull the utf8cpp submodule
PREBUILD =        taglib_prebuild

include ${KOS_PORTS}/scripts/kos-ports.mk

taglib_prebuild:
	cd build/${PORTNAME}-${PORTVERSION} ; git submodule update --init ;
