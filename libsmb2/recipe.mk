# Port Metadata
libsmb2_PORTVERSION =       6.2

libsmb2_MAINTAINER =        Ronnie Sahlberg
libsmb2_LICENSE =           LGPLv2.1
libsmb2_SHORT_DESC =        SMB2/3 userspace client

# This port uses the autotools scripts that are included with the distfiles.
libsmb2_PORT_BUILD =        cmake

# What files we need to download, and where from.
libsmb2_GIT_REPO =          https://github.com/sahlberg/libsmb2
libsmb2_GIT_HASH =          14fbe119b95032bd1ea8def8e6a7d75a26bd3809
libsmb2_DOWNLOAD_URL =      ${libsmb2_GIT_REPO}/archive/${libsmb2_GIT_HASH}.tar.gz
