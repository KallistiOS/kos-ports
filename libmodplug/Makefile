# Port Metadata
PORTNAME =          libmodplug
PORTVERSION =       0.8.9

MAINTAINER =        Nobody
LICENSE =           Public Domain
SHORT_DESC =        A library for MOD-like tracker music formats

PORT_BUILD = cmake

# What files we need to download, and where from.
GIT_REPOSITORIES =  https://git.code.sf.net/p/modplug-xmms/git

TARGET =            libmodplug.a
INSTALLED_HDRS =    src/modplug.h src/libmodplug/sndfile.h src/libmodplug/stdafx.h
HDR_INSTDIR =       modplug

DISTFILE_DIR = ${PORTNAME}-${PORTVERSION}/libmodplug

include ${KOS_PORTS}/scripts/kos-ports.mk
