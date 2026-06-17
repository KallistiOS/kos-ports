# Port Metadata
PORTNAME =          libAL
PORTVERSION =       1.0.0

MAINTAINER =        Luke Benstead <kazade@gmail.com>
LICENSE =           MIT License
SHORT_DESC =        OpenAL implementation for KOS
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORY =    https://gitlab.com/simulant/aldc.git

TARGET =            libAL.a
INSTALLED_HDRS =    include/AL/al.h include/AL/alc.h include/AL/alut.h
HDR_COMDIR =        AL

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
