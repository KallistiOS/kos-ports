# Port Metadata
PORTNAME =          libjpeg
PORTVERSION =       9.5

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           IJG license (see README in the source distribution!)
SHORT_DESC =        Freely available lossy image compression library (with KOS additions)

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITES =    http://ijg.org/files \
                    https://sources.buildroot.net/libjpeg/
DOWNLOAD_FILES =    jpegsrc.v9e.tar.gz

TARGET =            libjpeg.a
INSTALLED_HDRS =    jconfig.h jmorecfg.h jpeg.h jpeglib.h jpegint.h jerror.h
HDR_INSTDIR =       jpeg
DISTFILE_DIR =      jpeg-9e

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk kos_img.c kos_texture.c jpeg.h

include ${KOS_PORTS}/scripts/kos-ports.mk
