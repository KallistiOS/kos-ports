# Port Metadata
libkosh_PORTVERSION =       2.0.0

libkosh_MAINTAINER =        Nobody
libkosh_LICENSE =           KOS License
libkosh_SHORT_DESC =        The KallistiOS shell (library)

libkosh_DEPENDENCIES =      libconio

# What files we need to download, and where from.
libkosh_GIT_HASH =          535a1f04c141aa61ae176dc2d11c373ab8b6c493
libkosh_DOWNLOAD_SITE =     https://github.com/KallistiOS/libkosh/archive/
libkosh_DOWNLOAD_FILE =     ${libkosh_GIT_HASH}.tar.gz

libkosh_TARGET =            libkosh.a
libkosh_INSTALLED_HDRS =    include/kosh.h
libkosh_HDR_INSTDIR =       kosh
