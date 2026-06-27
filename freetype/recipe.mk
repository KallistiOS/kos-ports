# Port Metadata
freetype_PORTVERSION =       2.13.3

freetype_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
freetype_LICENSE =           FreeType License or GPLv2 (see docs/LICENSE.TXT in the source distribution)
freetype_SHORT_DESC =        Freely available software library to render fonts of various types.

# This port uses the autotools scripts that are included with the distfiles.
freetype_PORT_BUILD =        autotools

# FreeType optionally uses bz2lib, zlib, and libpng. Provide them.
freetype_DEPENDENCIES =      libbz2 zlib libpng

# What files we need to download, and where from.
freetype_DOWNLOAD_SITE =     https://download.savannah.gnu.org/releases/freetype/
freetype_DOWNLOAD_FILE =     freetype-2.13.3.tar.gz
freetype_DOWNLOAD_SHA256 =   5c3a8e78f7b24c20b25b54ee575d6daa40007a5f4eea2845861c3409b3021747

# Autotools setup work.
freetype_CONFIGURE_ARGS =    --disable-mmap --with-brotli=no --with-harfbuzz=no
