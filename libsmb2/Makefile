# Port Metadata
PORTNAME =          libsmb2
PORTVERSION =       6.2

MAINTAINER =        Ronnie Sahlberg
LICENSE =           LGPLv2.1
SHORT_DESC =        SMB2/3 userspace client
ARCHS_SUPPORTED =   dreamcast

# This port uses the autotools scripts that are included with the distfiles.
PORT_BUILD =        cmake

# Don't attempt to copy the target library, it will be in the inst dir already.
NOCOPY_TARGET =     1

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/sahlberg/libsmb2.git
GIT_BRANCH =        ${PORTNAME}-${PORTVERSION}
TARGET =            libsmb2.a
EXAMPLES_DIR =      examples

# cmake setup work.
CMAKE_ARGS =        -DINSTALL_INC_DIR=${KOS_PORTS}/${PORTNAME}/inst/ \
                    -DCMAKE_INSTALL_PREFIX=${KOS_PORTS}/${PORTNAME}/inst/
MAKE_TARGET =       all install

include ${KOS_PORTS}/scripts/kos-ports.mk
