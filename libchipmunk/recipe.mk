# Port Metadata
libchipmunk_PORTVERSION =       7.0.3.1

libchipmunk_MAINTAINER =        Donald Haase
libchipmunk_LICENSE =           MIT
libchipmunk_SHORT_DESC =        A fast and lightweight 2D game physics library.

# This port uses CMake.
libchipmunk_PORT_BUILD =        cmake

# What files we need to download, and where from.
#Official Chipmunk 7.0.3 does not build, so building straight from master
libchipmunk_GIT_HASH =          f2f3d66220b8bb1568b8402c6d194d73d4e477d1
libchipmunk_DOWNLOAD_URL =      https://github.com/slembcke/Chipmunk2D/archive/${libchipmunk_GIT_HASH}.tar.gz

# Build_demos is reliant on a built-in library sokol that doesn't have a DC port
libchipmunk_CMAKE_ARGS =        -DBUILD_STATIC=ON -DBUILD_SHARED=OFF -DBUILD_DEMOS=OFF -DINSTALL_STATIC=ON
