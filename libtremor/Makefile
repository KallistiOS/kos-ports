# Port Metadata
PORTNAME =          libtremor
PORTVERSION =       19480

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           3-clause BSD (see COPYING in the source distribution)
SHORT_DESC =        Vorbis audio decoder library (integer version)
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORY =    https://gitlab.xiph.org/xiph/tremor.git
GIT_BRANCH =        lowmem

TARGET =            libtremor.a
INSTALLED_HDRS =    ivorbiscodec.h ivorbisfile.h sndoggvorbis.h
HDR_INSTDIR =       vorbis

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk sndoggvorbis.h sndoggvorbis.c main.c \
                    sndvorbisfile.h

include ${KOS_PORTS}/scripts/kos-ports.mk
