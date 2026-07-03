# Port Metadata
SDL_PORTVERSION =       1.2.15

SDL_MAINTAINER =        Nobody
SDL_LICENSE =           LGPLv2.1
SDL_SHORT_DESC =        Simple Directmedia Library

# Required for OpenGL hardware acceleration
SDL_DEPENDENCIES =      libGL

# What files we need to download, and where from.
SDL_GIT_HASH =          6648216ef09099d722623a155693fabee972380f
SDL_DOWNLOAD_URL =      https://github.com/libsdl-org/SDL-1.2/archive/${SDL_GIT_HASH}.tar.gz

SDL_TARGET =            libSDL.a
SDL_HDR_DIRECTORY =     include
SDL_HDR_INSTDIR =       SDL

SDL_BUILD_ENV =         SDL_VERSION=${SDL_PORTVERSION} SDL_PC_PATH=${KOS_SYSROOT}/lib/pkgconfig/
