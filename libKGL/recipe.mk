# Port Metadata
libKGL_PORTVERSION =       2.0.0

libKGL_MAINTAINER =        Nobody
libKGL_LICENSE =           KOS License
libKGL_SHORT_DESC =        KallistiGL, deprecated OpenGL (tm) like graphics library for KOS

# What files we need to download, and where from.
libKGL_GIT_REPO =          https://github.com/KallistiOS/libkgl
libKGL_GIT_HASH =          8374cbee6c350612f38aeedf9a0af541e83aae76
libKGL_DOWNLOAD_URL =      ${libKGL_GIT_REPO}/archive/${libKGL_GIT_HASH}.tar.gz

libKGL_TARGET =            libKGL.a
libKGL_INSTALLED_HDRS =    include/gl.h include/glext.h include/glu.h include/glut.h
libKGL_HDR_INSTDIR =       KGL
