# Port Metadata
libzip_PORTVERSION =       1.0.1

libzip_MAINTAINER =        Damian Parrino <bucanero@users.noreply.github.com>
libzip_LICENSE =           3-clause BSD license
libzip_SHORT_DESC =        libzip is a C library for reading, creating, and modifying zip archives.

# This port uses CMake.
libzip_PORT_BUILD =        cmake

# This port requires zlib
libzip_DEPENDENCIES =      zlib

# What files we need to download, and where from.
libzip_DOWNLOAD_URL =      https://libzip.org/download/libzip-${libzip_PORTVERSION}.tar.gz
libzip_DOWNLOAD_SHA256 =   0cef914d8f5105ccac44484f61413daa08d7204758e77240a4d20ebf967f3d49

# Set cmake options
libzip_CMAKE_ARGS =        -Wno-dev -DCMAKE_POLICY_VERSION_MINIMUM=3.5
