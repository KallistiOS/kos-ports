# Port Metadata
libogg_PORTVERSION =       1.3.5

libogg_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
libogg_LICENSE =           3-clause BSD (see COPYING in the source distribution)
libogg_SHORT_DESC =        Multimedia container format access library

# This port uses the autotools scripts that are included with the distfiles.
libogg_PORT_BUILD =        autotools

# What files we need to download, and where from.
libogg_DOWNLOAD_SITE =     https://ftp.osuosl.org/pub/xiph/releases/ogg
libogg_DOWNLOAD_FILE =     libogg-${libogg_PORTVERSION}.tar.gz
libogg_DOWNLOAD_SHA256 =   0eb4b4b9420a0f51db142ba3f9c64b333f826532dc0f48c6410ae51f4799b664
