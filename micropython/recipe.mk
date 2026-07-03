# Port Metadata
micropython_PORTVERSION =       1.26.0

micropython_MAINTAINER =        Aaron Glazer <aaronglazer@google.com>
micropython_LICENSE =           MIT
micropython_SHORT_DESC =        A lean and efficient Python implementation

# What files we need to download, and where from.
micropython_DOWNLOAD_URL =      https://github.com/micropython/micropython/archive/refs/tags/v${micropython_PORTVERSION}.tar.gz

micropython_TARGET =            libmicropython.a
micropython_HDR_DIRECTORY =     micropython_embed
micropython_INSTALLED_HDRS =    mpconfigport.h
