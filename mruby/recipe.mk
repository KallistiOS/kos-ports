# Port Metadata
mruby_PORTVERSION =       3.3.0

mruby_MAINTAINER =        SiZiOUS <sizious@gmail.com>
mruby_LICENSE =           MIT
mruby_SHORT_DESC =        Lightweight Ruby

# What files we need to download, and where from.
mruby_DOWNLOAD_SITE =     https://github.com/mruby/mruby/archive/refs/tags/
mruby_DOWNLOAD_FILE =     ${mruby_PORTVERSION}.tar.gz

mruby_TARGET =            libmruby.a
mruby_HDR_DIRECTORY =     build/$(KOS_ARCH)/include
mruby_HDR_INSTDIR =       mruby
