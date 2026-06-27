# Port Metadata
libpng_PORTVERSION =       1.6.38

libpng_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
libpng_LICENSE =           zlib License - http://opensource.org/licenses/Zlib
libpng_SHORT_DESC =        Freely available lossless image compression library (with KOS additions)

libpng_DEPENDENCIES =      zlib

libpng_PORT_BUILD =        cmake

# What files we need to download, and where from.
libpng_DOWNLOAD_SITE =     https://download.sourceforge.net/libpng
libpng_DOWNLOAD_FILE =     libpng-${libpng_PORTVERSION}.tar.xz
libpng_DOWNLOAD_SHA256 =   b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be

libpng_CMAKE_ARGS =        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DPNG_EXECUTABLES=OFF -DPNG_SHARED=OFF -DPNG_TESTS=OFF
