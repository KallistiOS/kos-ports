# Port Metadata
PORTNAME =          freetype
PORTVERSION =       2.13.2

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           FreeType License or GPLv2 (see docs/LICENSE.TXT in the source distribution)
SHORT_DESC =        Freely available software library to render fonts of various types.

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD =        autotools

# Don't attempt to copy the target library, it will be in the inst dir already.
NOCOPY_TARGET =     1

# FreeType optionally uses bz2lib, zlib, and libpng. Provide them.
DEPENDENCIES =      libbz2 zlib libpng

# What files we need to download, and where from.
DOWNLOAD_SITES =    https://download.savannah.gnu.org/releases/freetype/ \
                    https://sourceforge.net/projects/freetype/files/freetype2/2.13.2/
DOWNLOAD_FILES =    freetype-2.13.2.tar.gz

TARGET =            libfreetype.a
HDR_FULLDIR =       freetype2
DISTFILE_DIR =      freetype-${PORTVERSION}


# Autotools setup work.
CONFIGURE_ARGS =    --disable-mmap --with-brotli=no --with-harfbuzz=no
CONFIGURE_DEFS =    ZLIB_CFLAGS=-I${KOS_PORTS}/include/zlib ZLIB_LIBS=-lz \
                    BZIP2_CFLAGS=-I${KOS_PORTS}/include/bzlib BZIP2_LIBS=-lbz2 \
                    LIBPNG_CFLAGS="-I${KOS_PORTS}/include/png -std=gnu11" LIBPNG_LIBS=-lpng
MAKE_TARGET =       all install

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =

include ${KOS_PORTS}/scripts/kos-ports.mk
