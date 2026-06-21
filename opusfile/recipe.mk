# Port Metadata
opusfile_PORTVERSION =       0.11

opusfile_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
opusfile_LICENSE =           3-clause BSD (see COPYING in the source distribution)
opusfile_SHORT_DESC =        Opus audio codec library high-level file access library

# This port uses the autotools scripts that are included with the distfiles.
opusfile_PORT_BUILD =        autotools

# This port requires opus and libogg
opusfile_DEPENDENCIES =      opus libogg

# What files we need to download, and where from.
opusfile_DOWNLOAD_SITE =     https://ftp.osuosl.org/pub/xiph/releases/opus
opusfile_DOWNLOAD_FILE =     opusfile-${opusfile_PORTVERSION}.tar.gz
opusfile_DOWNLOAD_SHA256 =   74ce9b6cf4da103133e7b5c95df810ceb7195471e1162ed57af415fabf5603bf

# Autotools setup work.
opusfile_CONFIGURE_ARGS =    --enable-fixed-point --disable-http --disable-doc
