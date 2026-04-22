# Port Metadata
PORTNAME =          libvldmail
PORTVERSION =       1.2.1

MAINTAINER =        Donald Haase
LICENSE =           MIT-0
SHORT_DESC =        An e-mail address validation library.

# This port uses CMake.
PORT_BUILD =        cmake
CMAKE_OUTSOURCE =   1
NOCOPY_TARGET = 1

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/dertuxmalwieder/libvldmail.git
GIT_BRANCH =        master
GIT_TAG =           release-${PORTVERSION}

TARGET =            libvldmail.a
INSTALLED_HDRS =    src/vldmail.h

PREINSTALL = vldmail_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk

vldmail_preinstall:
	mkdir -p inst/lib ; cp build/$(PORTNAME)-$(PORTVERSION)/build/$(TARGET) inst/lib; \
