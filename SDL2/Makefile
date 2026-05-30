# Port Metadata
PORTNAME =          SDL2
PORTVERSION =       latest

MAINTAINER =        GPFTroy
LICENSE =           Zlib
SHORT_DESC =        Simple DirectMedia Layer 2
DEPENDENCIES =      libGL

PORT_BUILD =        cmake

GIT_REPOSITORY =    https://github.com/GPF/SDL.git
GIT_BRANCH = 		dreamcastSDL2

TARGET =            libSDL2.a libSDL2main.a libSDL2_test.a
HDR_DIRECTORY =     include
HDR_INSTDIR =       SDL2
EXAMPLES_DIR =      test/dreamcast/test

CMAKE_ARGS = 		-DSDL_OPENGL=on -DSDL_HAPTIC=on -DSDL_TEST=on -DSDL_THREADS=on -DSDL_PTHREADS=on -DSDL_TIMER_UNIX=on
CMAKE_OUTSOURCE = 	1

include ${KOS_PORTS}/scripts/kos-ports.mk