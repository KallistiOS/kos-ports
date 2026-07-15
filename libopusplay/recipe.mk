# Port Metadata
libopusplay_PORTVERSION =       2.1.0

libopusplay_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
libopusplay_LICENSE =           KOS License
libopusplay_SHORT_DESC =        Opus audio playback library

# Requires opusfile (which will pull in opus and libogg)
libopusplay_DEPENDENCIES =      opusfile

# What files we need to download, and where from.
libopusplay_GIT_REPO =          https://github.com/KallistiOS/libopusplay
libopusplay_GIT_HASH =          1f8eaf7e3855d9c93c1e80095ea37364e5ccb7a3
libopusplay_DOWNLOAD_URL =      ${libopusplay_GIT_REPO}/archive/${libopusplay_GIT_HASH}.tar.gz

libopusplay_TARGET =            libopusplay.a
libopusplay_INSTALLED_HDRS =    opusplay.h
libopusplay_HDR_INSTDIR =       opus

libopusplay_KOS_MAKEFILE =      Makefile
