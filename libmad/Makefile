# Port Metadata
PORTNAME    =       libmad
PORTVERSION =       0.15.2b-1

MAINTAINER  =       Donald Haase
LICENSE     =       GPLv2
SHORT_DESC  =       MAD is a high-quality MPEG audio decoder.

# This port uses cmake to build.
PORT_BUILD      =        cmake

# Don't attempt to copy the target library, it will be in the inst dir already.
NOCOPY_TARGET   =     1

# Pulling from the Audacity maintained version.
GIT_REPOSITORY  = https://github.com/audacity/libmad.git
GIT_BRANCH      =   ${PORTVERSION}

TARGET          =   ${PORTNAME}.a

# The cmake is a bit at odds with the source as it tries defining these as on/off
# but the source just checks if they're defined at all and complains if both are.
# If that's ever updated (or patched here) these could be adjusted.
#CMAKE_ARGS      =   -DOPT_ACCURACY=OFF -DOPT_SPEED=ON

MAKE_TARGET     =   all install

include ${KOS_PORTS}/scripts/kos-ports.mk
