# Port Metadata
zlib_PORTVERSION =       1.3.2

zlib_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
zlib_LICENSE =           zlib License - http://opensource.org/licenses/Zlib
zlib_SHORT_DESC =        Lossless data compression library

zlib_PORT_BUILD =        cmake

# What files we need to download, and where from.
# Note: we use a github mirror as zlib.net often fails
#zlib_DOWNLOAD_SITE =    http://zlib.net
zlib_DOWNLOAD_SITE =     https://github.com/madler/zlib/releases/download/v${zlib_PORTVERSION}/
zlib_DOWNLOAD_FILE =     zlib-${zlib_PORTVERSION}.tar.gz
zlib_DOWNLOAD_SHA256 =   bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16

zlib_CMAKE_ARGS =        -DZLIB_BUILD_TESTING=OFF -DZLIB_BUILD_SHARED=OFF
