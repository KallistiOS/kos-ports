# Port Metadata
PORTNAME =          SDL2_image
PORTVERSION =       latest

MAINTAINER =        GPFTroy
LICENSE =           Zlib
SHORT_DESC =        Simple DirectMedia Layer 2
DEPENDENCIES =      libGL SDL2

PORT_BUILD =        cmake

GIT_REPOSITORY =    https://github.com/GPF/SDL_image.git
GIT_BRANCH = 		SDL2

TARGET =            libSDL2_image.a
INSTALLED_HDRS =        SDL_image.h
HDR_DIRECTORY =         ../../../include/SDL
HDR_INSTDIR =           SDL
EXAMPLES_DIR =      test

CMAKE_ARGS = 		-DSDL_OPENGL=on -DSDL_HAPTIC=on -DSDL_TEST=on -DSDL_THREADS=on -DSDL_PTHREADS=on -DSDL_TIMER_UNIX=on
CMAKE_OUTSOURCE = 	1

include ${KOS_PORTS}/scripts/kos-ports.mk
