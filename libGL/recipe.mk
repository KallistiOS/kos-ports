# Port Metadata
libGL_PORTVERSION =       1.1.1

libGL_MAINTAINER =        Luke Benstead <kazade@gmail.com>
libGL_LICENSE =           2-clause BSD (see LICENSE in the source distribution)
libGL_SHORT_DESC =        GLdc, an OpenGL (tm) like graphics library for KOS

libGL_PORT_BUILD =        cmake

libGL_GIT_HASH =          488968ce6118e421221c97211ccdcb02729ec33a
libGL_DOWNLOAD_SITE =     https://gitlab.com/simulant/GLdc/-/archive/${libGL_GIT_HASH}/
libGL_DOWNLOAD_FILE =     GLdc-${libGL_GIT_HASH}.tar.gz

libGL_CMAKE_ARGS =        -DBUILD_SAMPLES=OFF -DBUILD_TESTS=OFF
