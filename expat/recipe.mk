# Port Metadata
expat_PORTVERSION =       2.5.0

expat_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
expat_LICENSE =           MIT (see COPYING in the source distribution)
expat_SHORT_DESC =        A C library for parsing XML

# This port uses the autotools scripts that are included with the distfiles.
expat_PORT_BUILD =        autotools

# What files we need to download, and where from.
expat_DOWNLOAD_URL =      https://github.com/libexpat/libexpat/releases/download/R_2_5_0/expat-${expat_PORTVERSION}.tar.gz
expat_DOWNLOAD_SHA256 =   6b902ab103843592be5e99504f846ec109c1abb692e85347587f237a4ffa1033
