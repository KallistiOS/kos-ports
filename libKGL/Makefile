# Port Metadata
PORTNAME =          libKGL
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        KallistiGL, deprecated OpenGL (tm) like graphics library for KOS
ARCHS_SUPPORTED =   dreamcast

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libgl \
                    https://github.com/KallistiOS/libkgl.git

TARGET =            libKGL.a
INSTALLED_HDRS =    include/gl.h include/glext.h include/glu.h include/glut.h
HDR_COMDIR =        KGL

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
