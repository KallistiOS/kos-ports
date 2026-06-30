# Port Metadata
libADX_PORTVERSION =       1.0.1

libADX_MAINTAINER =        SiZiOUS <sizious@gmail.com>
libADX_LICENSE =           BSD 2-Clause License
libADX_SHORT_DESC =        Library for decoding ADX audio files

# What files we need to download, and where from.
libADX_DOWNLOAD_SITE =     https://github.com/sega-dreamcast/libADX/archive/
libADX_DOWNLOAD_FILE =     v${libADX_PORTVERSION}.tar.gz
libADX_DOWNLOAD_SHA256 =   7485a2b7d47431d5b66160c0a3769e79ce61ae9c0b317589363ef55f305e9ed1

libADX_TARGET =            libADX.a
libADX_INSTALLED_HDRS =    include/adx.h include/snddrv.h
libADX_HDR_INSTDIR =       adx
