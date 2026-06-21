# Port Metadata
libvldmail_PORTVERSION =       1.2.1

libvldmail_MAINTAINER =        Donald Haase
libvldmail_LICENSE =           MIT-0
libvldmail_SHORT_DESC =        An e-mail address validation library.

# This port uses CMake.
libvldmail_PORT_BUILD =        cmake

# What files we need to download, and where from.
libvldmail_GIT_HASH =          release-${libvldmail_PORTVERSION}
libvldmail_DOWNLOAD_SITE =     https://github.com/dertuxmalwieder/libvldmail/archive/
libvldmail_DOWNLOAD_FILE =     ${libvldmail_GIT_HASH}.tar.gz
