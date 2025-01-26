# Port Metadata
PORTNAME =          libchipmunk
PORTVERSION =       7.0.3.1

MAINTAINER =        Donald Haase
LICENSE =           MIT
SHORT_DESC =        A fast and lightweight 2D game physics library.

# This port uses CMake.
PORT_BUILD =        cmake

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/slembcke/Chipmunk2D.git
#Official Chipmunk 7.0.3 does not build, so building straight from master
#GIT_BRANCH =        Chipmunk-$(PORTVERSION)
TARGET =            libchipmunk.a

# This is required because the built-in cmake doesn't support custom install
# of headers. It does support custom installation of the lib itself via
# -DINSTALL_STATIC=ON and -DLIB_INSTALL_DIR=${KOS_PORTS}/${PORTNAME}/inst/lib
# But that forces the attempt to install the headers locally.
HDR_DIRECTORY =     include/chipmunk

# If the header installation issue above is fixed then install_static can be changed
# Build_demos is reliant on a built-in library sokol that doesn't have a DC port
CMAKE_ARGS =        -DBUILD_STATIC=ON -DBUILD_SHARED=OFF -DBUILD_DEMOS=OFF -DINSTALL_STATIC=OFF

# Add a pre-install target to get the built library where we expect it.
# This, copied from opus, might be solvable by
# adding an equivalent to HDR_DIRECTORY for lib
PREINSTALL =        chipmunk_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk
chipmunk_preinstall:
	cp build/${PORTNAME}-${PORTVERSION}/src/${TARGET} build/${PORTNAME}-${PORTVERSION}
