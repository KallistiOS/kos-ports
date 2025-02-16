# Port Metadata
PORTNAME =          curl
PORTVERSION =       7.64.1

MAINTAINER =        Damian Parrino <bucanero@users.noreply.github.com>
LICENSE =           custom
SHORT_DESC =        A library for transferring data with URL syntax.

# This port uses CMake.
PORT_BUILD =        cmake

# Provide SSL support library
DEPENDENCIES =      zlib polarssl

# What files we need to download, and where from.
DOWNLOAD_SITE  =    https://curl.se/download
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libcurl.a

# attempt to install the headers locally.
HDR_DIRECTORY =     include/curl

# cmake build arguments
CMAKE_ARGS =        -DCMAKE_USE_POLARSSL=1 -DUSE_UNIX_SOCKETS=0 -DENABLE_IPV6=0 -DENABLE_THREADED_RESOLVER=0 -DBUILD_CURL_EXE=OFF -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=OFF

# Add a pre-build target to adjust the source code
PREBUILD = curl_prebuild
curl_prebuild:
	cp files/CMakeLists.txt build/${PORTNAME}-${PORTVERSION}
	cp files/FindPolarSSL.cmake build/${PORTNAME}-${PORTVERSION}/CMake

# Add a pre-install target to get the built library where we expect it.
# This, copied from opus, might be solvable by
# adding an equivalent to HDR_DIRECTORY for lib
PREINSTALL = curl_preinstall
curl_preinstall:
	cp build/${PORTNAME}-${PORTVERSION}/lib/${TARGET} build/${PORTNAME}-${PORTVERSION}

include ${KOS_PORTS}/scripts/kos-ports.mk
