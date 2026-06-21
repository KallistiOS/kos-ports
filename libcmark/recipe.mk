# Port Metadata
libcmark_PORTVERSION =       0.31.2

libcmark_MAINTAINER =        Donald Haase
libcmark_LICENSE =           Custom (see the file COPYING provided with headers or at https://github.com/commonmark/cmark/blob/master/COPYING)
libcmark_SHORT_DESC =        CommonMark parsing and rendering library and program in C

# This port uses CMake.
libcmark_PORT_BUILD =        cmake

# What files we need to download, and where from.
libcmark_DOWNLOAD_SITE =     https://github.com/commonmark/cmark/archive/
libcmark_DOWNLOAD_FILE =     ${libcmark_PORTVERSION}.tar.gz
libcmark_DOWNLOAD_SHA256 =   f9bc5ca38bcb0b727f0056100fac4d743e768872e3bacec7746de28f5700d697

libcmark_CMAKE_ARGS =        -DBUILD_TESTING=NO
