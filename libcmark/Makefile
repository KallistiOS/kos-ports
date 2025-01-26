# Port Metadata
PORTNAME =          libcmark
PORTVERSION =       0.31.0

MAINTAINER =        Donald Haase
LICENSE =           Custom (see the file COPYING provided with headers or at https://github.com/commonmark/cmark/blob/master/COPYING)
SHORT_DESC =        CommonMark parsing and rendering library and program in C

# This port uses CMake.
PORT_BUILD =        cmake

# This directs the behavior of creating a subdirectory 'build' and executing cmake at '..'
CMAKE_OUTSOURCE =   1

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/commonmark/cmark.git
GIT_BRANCH =        ${PORTVERSION}
TARGET =            libcmark.a

INSTALLED_HDRS =    src/*.h COPYING

CMAKE_ARGS =        -DBUILD_SHARED_LIBS=NO -DBUILD_TESTING=NO

# Add a pre-install target to get the built library where we expect it.
# This, copied from opus, might be solvable by
# adding an equivalent to HDR_DIRECTORY for lib
PREINSTALL =        cmark_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk
cmark_preinstall:
	cp build/${PORTNAME}-${PORTVERSION}/build/src/${TARGET} build/${PORTNAME}-${PORTVERSION}
