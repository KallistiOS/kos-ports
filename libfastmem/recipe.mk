# Port Metadata
libfastmem_PORTVERSION =       1.0.0

libfastmem_MAINTAINER =        SiZiOUS <sizious@gmail.com>
libfastmem_LICENSE =           LGPLv2.1
libfastmem_SHORT_DESC =        Very optimized set of memory manipulation functions

# What files we need to download, and where from.
libfastmem_GIT_REPO =          https://github.com/sega-dreamcast/libfastmem
libfastmem_GIT_HASH =          d63e367b89f41040f70614ed5df1f4e7ca43c506
libfastmem_DOWNLOAD_URL =      ${libfastmem_GIT_REPO}/archive/${libfastmem_GIT_HASH}.tar.gz

libfastmem_TARGET =            libfastmem.a
libfastmem_INSTALLED_HDRS =    include/fastmem.h
libfastmem_HDR_INSTDIR =       fastmem
