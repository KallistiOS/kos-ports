# Port Metadata
PORTNAME =          lua
PORTVERSION =       5.4.7

MAINTAINER =        Falco Girgis (GyroVorbis)
LICENSE =           MIT
SHORT_DESC =        Embeddable scripting language

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE =     http://www.lua.org/ftp
DOWNLOAD_FILES =    ${PORTNAME}-${PORTVERSION}.tar.gz

TARGET =            liblua.a
INSTALLED_HDRS =    src/lua.h src/luaconf.h src/lualib.h src/lauxlib.h \
                    src/lua.hpp
HDR_INSTDIR =       lua

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
