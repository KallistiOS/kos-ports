# Port Metadata
libjimtcl_PORTVERSION =       1.0.0

libjimtcl_MAINTAINER =        Spencer (@spencerelliott)
libjimtcl_LICENSE =           FreeBSD
libjimtcl_SHORT_DESC =        An open-source, small footprint implementation of Tcl

libjimtcl_PORT_BUILD =        autotools

# What files we need to download, and where from.
libjimtcl_GIT_REPO =          https://github.com/msteveb/jimtcl
libjimtcl_GIT_HASH =          ac7c48b9ba841d6d0e90dda5dafaa174a3e02679
libjimtcl_DOWNLOAD_URL =      ${libjimtcl_GIT_REPO}/archive/${libjimtcl_GIT_HASH}.tar.gz

libjimtcl_CONFIGURE_ARGS =     --without-ext="aio,zlib"
libjimtcl_CONFIGURE_NO_CACHE_FILE = 1
