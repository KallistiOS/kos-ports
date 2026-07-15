# Port Metadata
opus_PORTVERSION =       1.3.1

opus_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
opus_LICENSE =           3-clause BSD (see COPYING in the source distribution)
opus_SHORT_DESC =        Opus audio codec library

# This port uses the autotools scripts that are included with the distfiles.
opus_PORT_BUILD =        autotools

# What files we need to download, and where from.
opus_DOWNLOAD_URL =      https://ftp.osuosl.org/pub/xiph/releases/opus/opus-${opus_PORTVERSION}.tar.gz
opus_DOWNLOAD_SHA256 =   65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d

# Autotools setup work.
opus_CONFIGURE_ARGS =    --enable-fixed-point --disable-extra-programs --disable-doc
