# Port Metadata
libparallax_PORTVERSION =       2.0.0

libparallax_MAINTAINER =        Nobody
libparallax_LICENSE =           KOS License
libparallax_SHORT_DESC =        Simple (mostly 2D) game API library

libparallax_DEPENDENCIES =      kos-png kos-jpeg libkmg

# What files we need to download, and where from.
libparallax_GIT_HASH =          a7591bb0d6065e6c5b7663741054c51a5aeb1ea2
libparallax_DOWNLOAD_URL =      https://github.com/KallistiOS/libparallax/archive/${libparallax_GIT_HASH}.tar.gz

libparallax_TARGET =            libparallax.a
libparallax_INSTALLED_HDRS =    include/color.h include/context.h include/dr.h \
                    include/font.h include/list.h include/matrix.h \
                    include/prim.h include/sprite.h include/texture.h
libparallax_HDR_INSTDIR =       plx
