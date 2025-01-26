# Port Metadata
PORTNAME =          libzip
PORTVERSION =       1.0.1

MAINTAINER =        Damian Parrino <bucanero@users.noreply.github.com>
LICENSE =           3-clause BSD license
SHORT_DESC =        libzip is a C library for reading, creating, and modifying zip archives.

# This port uses CMake.
PORT_BUILD =        cmake

# This port requires zlib
DEPENDENCIES =      zlib

# What files we need to download, and where from.
DOWNLOAD_SITE  =    https://libzip.org/download
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libzip.a

# Set cmake options
CMAKE_ARGS =        -Wno-dev -DCMAKE_INSTALL_PREFIX=../../inst \
                    -DCMAKE_C_FLAGS="-I{$KOS_PORTS}/include/zlib" \
                    -DZLIB_INCLUDE_DIR="${KOS_PORTS}/include/zlib"

MAKE_TARGET =       zip

# Adjust the source code
PREBUILD =          libzip_prebuild

# Add a pre-install target to get the built library where we expect it.
# Copy the header files manually
PREINSTALL =        libzip_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk
libzip_prebuild:
	cd "build/${PORTNAME}-${PORTVERSION}" && \
	patch -p1 < ../../files/${PORTNAME}-${PORTVERSION}.patch || { exit 1; }

libzip_preinstall:
	cp "build/${PORTNAME}-${PORTVERSION}/lib/libzip.a" "build/${PORTNAME}-${PORTVERSION}"
	mkdir -p inst/include
	cp "build/${PORTNAME}-${PORTVERSION}/lib/zip.h" inst/include
	cp "build/${PORTNAME}-${PORTVERSION}/zipconf.h" inst/include
