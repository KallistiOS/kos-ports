# Port Metadata
PORTNAME =          libpdcurses
PORTVERSION =       1.0.0

MAINTAINER =        Donald Haase
LICENSE =           Public Domain
SHORT_DESC =        PDCurses is a public domain curses library

# Requires SDL1 for now
DEPENDENCIES = SDL

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/wmcbrine/PDCurses.git

TARGET =            libpdcurses.a
INSTALLED_HDRS =    curses.h
HDR_INSTDIR =       PDCurses
EXAMPLES_DIR =      demos

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
