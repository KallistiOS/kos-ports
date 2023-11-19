# Port Metadata
PORTNAME =          micropython
PORTVERSION =       1.21.0

MAINTAINER =        Aaron Glazer <aaronglazer@google.com>
LICENSE =           MIT
SHORT_DESC =        A lean and efficient Python implementation

DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/micropython/micropython.git

TARGET =            libmicropython.a
HDR_DIRECTORY =     micropython_embed
INSTALLED_HDRS =    mpconfigport.h
HDR_INSTDIR =       micropython

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk mpconfigport.h

include ${KOS_PORTS}/scripts/kos-ports.mk
