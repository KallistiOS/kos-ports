# Port Metadata
PORTNAME =          libGL
PORTVERSION =       1.1.0

MAINTAINER =        Luke Benstead <kazade@gmail.com>
LICENSE =           2-clause BSD (see LICENSE in the source distribution)
SHORT_DESC =        GLdc, an OpenGL (tm) like graphics library for KOS

PORT_BUILD =        cmake

GIT_REPOSITORY =    https://gitlab.com/simulant/GLdc.git

TARGET =            libGL.a
INSTALLED_HDRS =    include/GL/gl.h include/GL/glext.h include/GL/glkos.h include/GL/glu.h
HDR_COMDIR =        GL
EXAMPLES_DIR =      samples

# -DCMAKE_BUILD_TYPE=Release forces GLdc to build with upstream's release optimization
# flags. Remove this argument to create a build without overriding $KOS_CFLAGS.
CMAKE_ARGS =        -DCMAKE_BUILD_TYPE=Release

PREINSTALL =        move_samples

include ${KOS_PORTS}/scripts/kos-ports.mk
move_samples:
	mv build/${PORTNAME}-${PORTVERSION}/*.elf build/${PORTNAME}-${PORTVERSION}/samples
