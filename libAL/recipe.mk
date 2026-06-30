# Port Metadata
libAL_PORTVERSION =       1.0.0

libAL_MAINTAINER =        Luke Benstead <kazade@gmail.com>
libAL_LICENSE =           MIT License
libAL_SHORT_DESC =        OpenAL implementation for KOS

libAL_DEPENDENCIES =      libGL

libAL_PORT_BUILD =        cmake

# What files we need to download, and where from.
libAL_GIT_HASH =          4716b658e05ee39387aca0639276e239b1cca188
libAL_DOWNLOAD_SITE =     https://gitlab.com/simulant/aldc/-/archive/${libAL_GIT_HASH}/
libAL_DOWNLOAD_FILE =     aldc-${libAL_GIT_HASH}.tar.gz

libAL_CMAKE_ARGS =        -DBUILD_SAMPLES=OFF
