# Port Metadata
PORTNAME =          libvorbis
PORTVERSION =       1.3.7

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           3-clause BSD (see COPYING in the source distribution)
SHORT_DESC =        Vorbis audio codec library (floating-point version)
ARCHS_SUPPORTED =   dreamcast

DEPENDENCIES =      libogg

# What files we need to download, and where from.
DOWNLOAD_SITE =     https://ftp.osuosl.org/pub/xiph/releases/vorbis
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libvorbis.a
INSTALLED_HDRS =    include/vorbis/codec.h include/vorbis/vorbisenc.h \
                    include/vorbis/vorbisfile.h
HDR_INSTDIR =       vorbis

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
