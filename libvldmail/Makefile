# Port Metadata
PORTNAME =          libvldmail
PORTVERSION =       1.0.0

MAINTAINER =        Donald Haase
LICENSE =           MIT-0
SHORT_DESC =        An e-mail address validation library.

# This port uses CMake.
PORT_BUILD =        cmake

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/dertuxmalwieder/libvldmail.git
TARGET =            libvldmail.a
INSTALLED_HDRS =    src/vldmail.h

#Passing this causes the test to be built as a .elf in the build dir.
#It doesn't quite match the current scheme we have for 'examples'
CMAKE_ARGS =        -DBUILD_THE_TEST=1

include ${KOS_PORTS}/scripts/kos-ports.mk
