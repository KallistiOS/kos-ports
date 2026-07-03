# Port Metadata
libconio_PORTVERSION =       2.0.0

libconio_MAINTAINER =        Nobody
libconio_LICENSE =           KOS License
libconio_SHORT_DESC =        Console-like I/O library

# What files we need to download, and where from.
libconio_GIT_HASH =          36c234b93c6ba44b58417c18b45828ec62b4d1c2
libconio_DOWNLOAD_URL =      https://github.com/KallistiOS/libconio/archive/${libconio_GIT_HASH}.tar.gz

libconio_TARGET =            libconio.a
libconio_INSTALLED_HDRS =    include/conio.h include/draw.h include/input.h
libconio_HDR_INSTDIR =       conio
