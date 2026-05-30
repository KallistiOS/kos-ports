# Port Metadata
PORTNAME =          libexif
PORTVERSION =       0.6.25

MAINTAINER =        Donald Haase
LICENSE =           LGPL 2.1
SHORT_DESC =        A library for parsing, editing, and saving EXIF data 

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD =        autotools

# Don't attempt to copy the target library, it will be in the inst dir already.
NOCOPY_TARGET =     1

# What files we need to download, and where from.
DOWNLOAD_SITES =    https://github.com/libexif/libexif/releases/download/v$(PORTVERSION)/
DOWNLOAD_FILES =    $(PORTNAME)-$(PORTVERSION).tar.bz2

TARGET =            $(PORTNAME).a

# Autotools setup work.
MAKE_TARGET =       all install

include ${KOS_PORTS}/scripts/kos-ports.mk
