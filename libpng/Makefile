# Port Metadata
PORTNAME =          libpng
PORTVERSION =       1.6.37

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           zlib License - http://opensource.org/licenses/Zlib
SHORT_DESC =        Freely available lossless image compression library (with KOS additions)
ARCHS_SUPPORTED =   dreamcast

DEPENDENCIES =      zlib

# What files we need to download, and where from.
DOWNLOAD_SITES =    https://download.sourceforge.net/libpng
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libpng.a
INSTALLED_HDRS =    png.h pngconf.h readpng.h kospng.h pnglibconf.h
HDR_INSTDIR =       png

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk kos_texture.c kos_img.c readpng.h kospng.h \
                    readpng.c writepng.c

include ${KOS_PORTS}/scripts/kos-ports.mk
