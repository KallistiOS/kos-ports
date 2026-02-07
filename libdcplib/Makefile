# Port Metadata
PORTNAME =          libdcplib
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           LGPLv2 (with embedded system exemption)
SHORT_DESC =        A portable game programming library
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libdcplib \
                    https://github.com/KallistiOS/libdcplib.git

TARGET =            libdcplib.a
INSTALLED_HDRS =    include/fnt.h include/sg.h include/ul.h
HDR_INSTDIR =       dcplib

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
