# Port Metadata
PORTNAME =          mruby
PORTVERSION =       3.3.0

MAINTAINER =        SiZiOUS <sizious@gmail.com>
LICENSE =           MIT
SHORT_DESC =        Lightweight Ruby

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/mruby/mruby.git
GIT_BRANCH =        master
GIT_TAG =           3.3.0

TARGET =            libmruby.a
HDR_DIRECTORY =     build/$(KOS_ARCH)/include
HDR_INSTDIR =       mruby

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
