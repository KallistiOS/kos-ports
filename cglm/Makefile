# Port Metadata
PORTNAME =          cglm
PORTVERSION =       1.0.0

MAINTAINER =        Donald Haase
LICENSE =           MIT
SHORT_DESC =        Highly optimized 2D|3D math library, also known as OpenGL Mathematics (glm) for `C`

# This port uses CMake.
PORT_BUILD =        cmake

# Don't attempt to copy the target library, it will be in the inst dir already.
NOCOPY_TARGET =     1


# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/recp/cglm.git
HDR_FULLDIR =       cglm
TARGET =            libcglm.a
EXAMPLES_DIR =      test

# cmake setup work.
CMAKE_ARGS =        -DCGLM_STATIC=ON
MAKE_TARGET =       all install

include ${KOS_PORTS}/scripts/kos-ports.mk
