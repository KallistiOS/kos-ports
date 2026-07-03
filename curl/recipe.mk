# Port Metadata
curl_PORTVERSION =       8.18.0

curl_MAINTAINER =        Damian Parrino <bucanero@users.noreply.github.com>
curl_LICENSE =           custom
curl_SHORT_DESC =        A library for transferring data with URL syntax.

# This port uses CMake.
curl_PORT_BUILD =        cmake

# Provide SSL support library
curl_DEPENDENCIES =      zlib mbedtls

# What files we need to download, and where from.
curl_DOWNLOAD_URL =      https://curl.se/download/curl-${curl_PORTVERSION}.tar.gz
curl_DOWNLOAD_SHA256 =   e9274a5f8ab5271c0e0e6762d2fce194d5f98acc568e4ce816845b2dcc0cf88f

# cmake build arguments
curl_CMAKE_ARGS =        -DCURL_USE_MBEDTLS=ON \
                    -DUSE_UNIX_SOCKETS=OFF \
                    -DENABLE_IPV6=OFF \
                    -DENABLE_THREADED_RESOLVER=OFF \
                    -DBUILD_CURL_EXE=OFF \
                    -DBUILD_TESTING=OFF \
                    -DCURL_USE_LIBPSL=OFF \
                    -DCURL_USE_LIBSSH2=OFF \
                    -DCURL_BROTLI=OFF \
                    -DCURL_ZSTD=OFF \
                    -DUSE_NGHTTP2=OFF \
                    -DCMAKE_POLICY_VERSION_MINIMUM=3.7 \
                    -DHAVE_SCHED_YIELD=0
