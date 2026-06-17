# Port Metadata
PORTNAME =          libopusplay
PORTVERSION =       2.1.0

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           KOS License
SHORT_DESC =        Opus audio playback library
ARCHS_SUPPORTED =   dreamcast

# Requires opusfile (which will pull in opus and libogg)
DEPENDENCIES =      opusfile

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libopusplay \
                    https://github.com/KallistiOS/libopusplay.git

TARGET =            libopusplay.a
INSTALLED_HDRS =    opusplay.h
HDR_INSTDIR =       opusplay

KOS_MAKEFILE =      Makefile

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =

include ${KOS_PORTS}/scripts/kos-ports.mk
