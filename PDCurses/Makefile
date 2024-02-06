# Port Metadata
PORTNAME = 			PDCurses
PORTVERSION = 		master

MAINTAINER =        Quzar
LICENSE =           Public Domain
SHORT_DESC =        PDCurses

# Requires SDL1 for now
DEPENDENCIES = SDL

# What files we need to download, and where from.
GIT_REPOSITORY = 	https://github.com/wmcbrine/PDCurses.git

TARGET =			libPDCurses.a
INSTALLED_HDRS =    curses.h
HDR_INSTDIR =       PDCurses
EXAMPLES_DIR =      demos

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =		KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
