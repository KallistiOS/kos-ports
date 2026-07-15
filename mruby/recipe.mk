# Port Metadata
mruby_PORTVERSION =       4.0.0

mruby_MAINTAINER =        SiZiOUS <sizious@gmail.com>
mruby_LICENSE =           MIT
mruby_SHORT_DESC =        Lightweight Ruby

# What files we need to download, and where from.
mruby_DOWNLOAD_URL =      https://github.com/mruby/mruby/archive/refs/tags/${mruby_PORTVERSION}.tar.gz
mruby_DOWNLOAD_SHA256 =   e2ea271dbed14e9f2b33df773ae447b747dbc242ce2675022c0a57efea85a7b4

# Override the CC/RANLIB/AR variables set to the target tools in the Makefile
mruby_BUILD_ENV =         CC=cc RANLIB=ranlib AR=ar

mruby_TARGET =            libmruby.a
mruby_HDR_DIRECTORY =     build/$(KOS_ARCH)/include
