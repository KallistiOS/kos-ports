# Port Metadata
libbz2_PORTVERSION =       1.0.8

libbz2_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
libbz2_LICENSE =           BSD-like (see LICENSE in the source distribution)
libbz2_SHORT_DESC =        Block-sorting compression library

libbz2_PORT_BUILD =        cmake

# What files we need to download, and where from.
libbz2_DOWNLOAD_SITE =     http://cdn-fastly.deb.debian.org/debian/pool/main/b/bzip2/
libbz2_DOWNLOAD_FILE =     bzip2_1.0.8.orig.tar.gz
libbz2_DOWNLOAD_SHA256 =   ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269

CMAKE_ARGS =               -DBZIP2_VERSION=${libbz2_PORTVERSION}
