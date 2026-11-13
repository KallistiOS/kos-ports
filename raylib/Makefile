# Port Metadata
PORTNAME =          raylib
PORTVERSION =       6.0

MAINTAINER =        bigboss TGK
LICENSE =           zlib License - http://opensource.org/licenses/Zlib
SHORT_DESC =        raylib is a simple and easy-to-use library to enjoy videogames programming.

DEPENDENCIES =      libGL
NOCOPY_TARGET =     1

REQUIRES_ABI =      -m4-single

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/raylib4Consoles/raylib
GIT_BRANCH =        raylib4Consoles_6.0

TARGET =            libraylib.a
HDRS =              raylib.h raymath.h rlgl.h rcamera.h
HDR_INSTDIR =       raylib
DISTFILE_DIR =      ${PORTNAME}-${PORTVERSION}/src

KOS_MAKEFILE =      Makefile
MAKE_TARGET =       PLATFORM=PLATFORM_DREAMCAST

PREINSTALL =        raylib_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk

raylib_preinstall:
	@mkdir -p inst/lib inst/include
	@cp build/${DISTFILE_DIR}/${TARGET} inst/lib
	@for hdr in ${HDRS}; do \
		cp build/${DISTFILE_DIR}/$$hdr inst/include; \
	done
