# Port Metadata
PORTNAME =          liboggvorbisplay
PORTVERSION =       2.0.0

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           KOS License
SHORT_DESC =        Ogg Vorbis audio streaming library
ARCHS_SUPPORTED =   dreamcast

DEPENDENCIES =      libvorbis

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/liboggvorbis \
                    https://github.com/KallistiOS/liboggvorbisplay.git

TARGET =            liboggvorbisplay.a
INSTALLED_HDRS =    include/oggvorbis/sndoggvorbis.h
HDR_INSTDIR =       oggvorbis

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
