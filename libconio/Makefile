# Port Metadata
PORTNAME =          libconio
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        Console-like I/O library
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libconio \
                    https://github.com/KallistiOS/libconio.git

TARGET =            libconio.a
INSTALLED_HDRS =    include/conio.h include/draw.h include/input.h
HDR_INSTDIR =       conio

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
