# Port Metadata
libvorbis_PORTVERSION =       1.3.7

libvorbis_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
libvorbis_LICENSE =           3-clause BSD (see COPYING in the source distribution)
libvorbis_SHORT_DESC =        Vorbis audio codec library (floating-point version)

libvorbis_DEPENDENCIES =      libogg

libvorbis_PORT_BUILD =        cmake

# What files we need to download, and where from.
libvorbis_DOWNLOAD_SITE =     https://ftp.osuosl.org/pub/xiph/releases/vorbis
libvorbis_DOWNLOAD_FILE =     libvorbis-${libvorbis_PORTVERSION}.tar.gz
libvorbis_DOWNLOAD_SHA256 =   0e982409a9c3fc82ee06e08205b1355e5c6aa4c36bca58146ef399621b0ce5ab

libvorbis_CMAKE_ARGS =        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
