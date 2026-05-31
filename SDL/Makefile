# Port Metadata
PORTNAME =          SDL
PORTVERSION =       1.2.15

MAINTAINER =        Nobody
LICENSE =           LGPLv2.1
SHORT_DESC =        Simple Directmedia Library

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/libsdl-org/SDL-1.2.git

KOS_MAKEFILE =      Makefile.dc

#set GL = 1 to link with GLdc
GL ?=               1
ifeq ($(GL),1)
  MAKE_TARGET =       GL=1
  TARGET =            libSDL_gl.a
else
  MAKE_TARGET =       GL=
  TARGET =            libSDL.a
endif

HDR_DIRECTORY =     include
HDR_INSTDIR =       SDL

include ${KOS_PORTS}/scripts/kos-ports.mk
