# Port Metadata
PORTNAME =          raylib4dc
PORTVERSION =       5.5.0

MAINTAINER =        Andress Barajas
LICENSE =           zlib License - http://opensource.org/licenses/Zlib
SHORT_DESC =        raylib is a simple and easy-to-use library to enjoy videogames programming.

DEPENDENCIES =      libGL

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/raylib4Consoles/raylib
GIT_BRANCH =        raylib4Consoles

TARGET =            libraylib.a
HDRS =              raylib.h raymath.h rlgl.h
HDR_INSTDIR =       raylib
DISTFILE_DIR =      ${PORTNAME}-${PORTVERSION}/src
INSTALLED_HDRS =    ${HDRS}

KOS_MAKEFILE =      Makefile

include ${KOS_PORTS}/scripts/kos-ports.mk
