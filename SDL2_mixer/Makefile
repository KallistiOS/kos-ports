# Port Metadata
PORTNAME =          SDL2_mixer
PORTVERSION =       b2

MAINTAINER =        GPFTroy
LICENSE =           Zlib
SHORT_DESC =        Simple DirectMedia Layer 2
DEPENDENCIES =      libGL opusfile opus SDL2

PORT_BUILD =        cmake

GIT_REPOSITORY =    https://github.com/GPF/SDL_mixer.git
GIT_BRANCH = 		SDL2

TARGET =            libSDL2_mixer.a
INSTALLED_HDRS =        SDL_mixer.h
HDR_DIRECTORY =         ../../../include/SDL
HDR_INSTDIR =           SDL
EXAMPLES_DIR =      test

CMAKE_ARGS = 		-DSDL_OPENGL=on -DSDL_HAPTIC=on -DSDL_TEST=on -DSDL_THREADS=on -DSDL_PTHREADS=on -DSDL_TIMER_UNIX=on
CMAKE_OUTSOURCE = 	1

include ${KOS_PORTS}/scripts/kos-ports.mk
