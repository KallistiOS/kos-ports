# Port Metadata
libGL_PORTVERSION =       1.1.1

libGL_MAINTAINER =        Luke Benstead <kazade@gmail.com>
libGL_LICENSE =           2-clause BSD (see LICENSE in the source distribution)
libGL_SHORT_DESC =        GLdc, an OpenGL (tm) like graphics library for KOS

libGL_PORT_BUILD =        cmake

libGL_GIT_HASH =          5f374e7bfdb277f2c3cae61ad86118ce05e3c0d7
libGL_DOWNLOAD_SITE =     https://gitlab.com/pcercuei/GLdc/-/archive/${libGL_GIT_HASH}/
libGL_DOWNLOAD_FILE =     GLdc-${libGL_GIT_HASH}.tar.gz

libGL_CMAKE_ARGS =        -DBUILD_SAMPLES=OFF -DBUILD_TESTS=OFF
