# Port Metadata
PORTNAME =          curl
PORTVERSION =       8.18.0

MAINTAINER =        Damian Parrino <bucanero@users.noreply.github.com>
LICENSE =           custom
SHORT_DESC =        A library for transferring data with URL syntax.

# This port uses CMake.
PORT_BUILD =        cmake

# Provide SSL support library
DEPENDENCIES =      zlib mbedtls

# What files we need to download, and where from.
DOWNLOAD_SITE  =    https://curl.se/download
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            libcurl.a

# attempt to install the headers locally.
HDR_DIRECTORY =     include/curl

# cmake build arguments
CMAKE_ARGS =        -DCURL_USE_MBEDTLS=ON \
                    -DMBEDTLS_INCLUDE_DIR=${KOS_PORTS}/include \
                    -DMBEDTLS_LIBRARY=${KOS_PORTS}/lib/libmbedtls.a \
                    -DMBEDX509_LIBRARY=${KOS_PORTS}/lib/libmbedx509.a \
                    -DMBEDCRYPTO_LIBRARY=${KOS_PORTS}/lib/libmbedcrypto.a \
                    -DZLIB_INCLUDE_DIR=${KOS_PORTS}/include/zlib \
                    -DZLIB_LIBRARY=${KOS_PORTS}/lib/libz.a \
                    -DUSE_UNIX_SOCKETS=OFF \
                    -DENABLE_IPV6=OFF \
                    -DENABLE_THREADED_RESOLVER=OFF \
                    -DBUILD_CURL_EXE=OFF \
                    -DBUILD_SHARED_LIBS=OFF \
                    -DBUILD_STATIC_LIBS=ON \
                    -DBUILD_TESTING=OFF \
                    -DCURL_USE_LIBPSL=OFF \
                    -DCURL_USE_LIBSSH2=OFF \
                    -DCURL_BROTLI=OFF \
                    -DCURL_ZSTD=OFF \
                    -DUSE_NGHTTP2=OFF \
                    -DCMAKE_POLICY_VERSION_MINIMUM=3.7 \
                    -DHAVE_SCHED_YIELD=0

# Add a pre-install target to get the built library where we expect it.
PREINSTALL = curl_preinstall
curl_preinstall:
	cp build/${PORTNAME}-${PORTVERSION}/lib/${TARGET} build/${PORTNAME}-${PORTVERSION}

include ${KOS_PORTS}/scripts/kos-ports.mk
