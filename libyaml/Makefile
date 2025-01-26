# Port Metadata
PORTNAME =          libyaml
PORTVERSION =       0.2.5

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           MIT (see License in the source distribution)
SHORT_DESC =        A C library for parsing and emitting YAML

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD =        autotools

# Don't attempt to copy the target library, it will be in the inst dir already.
NOCOPY_TARGET =     1

# No external dependencies.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     https://github.com/yaml/libyaml/releases/download/${PORTVERSION}
DOWNLOAD_FILES =    yaml-${PORTVERSION}.tar.gz

TARGET =            libyaml.a
HDR_INSTDIR =       yaml
DISTFILE_DIR =      yaml-${PORTVERSION}

# Autotools setup work.
CONFIGURE_ARGS =
CONFIGURE_DEFS =    RANLIB=${KOS_RANLIB} AR=${KOS_AR}
MAKE_TARGET =       all install

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =

include ${KOS_PORTS}/scripts/kos-ports.mk
