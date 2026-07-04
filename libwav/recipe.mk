# Port Metadata
libwav_PORTVERSION =       1.0.0

libwav_MAINTAINER =        Andy Barajas
libwav_LICENSE =           Public Domain
libwav_SHORT_DESC =        Library for decoding WAV file headers

# What files we need to download, and where from.
libwav_GIT_REPO =          https://github.com/Dreamcast-Projects/libwav
libwav_GIT_HASH =          d6f1a89b7f6d50c1e429c10a6f43379f89b8e161
libwav_DOWNLOAD_URL =      ${libwav_GIT_REPO}/archive/${libwav_GIT_HASH}.tar.gz

libwav_TARGET =            libwav.a
libwav_INSTALLED_HDRS =    sndwav.h
libwav_HDR_INSTDIR =       wav
