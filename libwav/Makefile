# Port Metadata
PORTNAME =		libwav
PORTVERSION =	1.0.0

MAINTAINER =	Andy Barajas
LICENSE =		Public Domain
SHORT_DESC =	Library for decoding WAV file headers 

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORY =	https://github.com/Dreamcast-Projects/libwav.git

TARGET =		    libwav.a
INSTALLED_HDRS =	sndwav.h
HDR_INSTDIR =		wav

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =		KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
