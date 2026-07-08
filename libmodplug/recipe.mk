# Port Metadata
libmodplug_PORTVERSION =       0.7

libmodplug_MAINTAINER =        Nobody
libmodplug_LICENSE =           Public Domain
libmodplug_SHORT_DESC =        A library for MOD-like tracker music formats

# What files we need to download, and where from.
libmodplug_GIT_REPO =          https://github.com/KallistiOS/libmodplug
libmodplug_GIT_HASH =          331710dcc362013080e621d51d826c05e880022a
libmodplug_DOWNLOAD_URL =      ${libmodplug_GIT_REPO}/archive/${libmodplug_GIT_HASH}.tar.gz

libmodplug_TARGET =            libmodplug.a
libmodplug_INSTALLED_HDRS =    include/modplug.h include/sndfile.h include/stdafx.h
libmodplug_HDR_INSTDIR =       libmodplug

libmodplug_BUILD_ENV =         MODPLUG_VERSION=${libmodplug_PORTVERSION} MODPLUG_PC_PATH=${KOS_SYSROOT}/lib/pkgconfig/
