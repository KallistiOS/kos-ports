lftpd_PORTVERSION =       1.0.0

lftpd_MAINTAINER =        Andy Barajas
lftpd_LICENSE =           MIT
lftpd_SHORT_DESC =        Small embeddable FTP server library

# Upstream source.
lftpd_GIT_REPO =          https://github.com/Dreamcast-Projects/lftpd
lftpd_GIT_HASH =          81af50cae823e3fb8204d1cec732871723da1693
lftpd_DOWNLOAD_URL =      ${lftpd_GIT_REPO}/archive/${lftpd_GIT_HASH}.tar.gz

lftpd_TARGET =            liblftpd.a
lftpd_INSTALLED_HDRS =    include/lftpd.h
