# Port Metadata
libmpeg_PORTVERSION =       2.0.1

libmpeg_MAINTAINER =        Andy Barajas
libmpeg_LICENSE =           MIT
libmpeg_SHORT_DESC =        Library for decoding MPEG1 Video, MP2 Audio using pl_mpeg

# What files we need to download, and where from.
libmpeg_DOWNLOAD_SITE =     https://github.com/Dreamcast-Projects/pl_mpeg/archive/
libmpeg_DOWNLOAD_FILE =     v${libmpeg_PORTVERSION}.tar.gz

libmpeg_TARGET =            libmpeg.a
libmpeg_INSTALLED_HDRS =    mpeg.h
libmpeg_HDR_INSTDIR =       mpeg
