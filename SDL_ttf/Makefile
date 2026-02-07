# Port Metadata
PORTNAME =          SDL_ttf
PORTVERSION =       1.2

MAINTAINER =        Donald Haase
LICENSE =           zlib License - http://opensource.org/licenses/Zlib
SHORT_DESC =        SDL TrueType font library
ARCHS_SUPPORTED =   dreamcast

# This port could use autotools, but it tries to build the glfont example which uses
# functionality currently unsupported by gldc..
#PORT_AUTOTOOLS =    1

# No dependencies beyond the base system.
DEPENDENCIES =      SDL libbz2 zlib libpng freetype

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/libsdl-org/SDL_ttf.git
GIT_BRANCH =        SDL-1.2

TARGET =            libSDL_ttf.a
#There's a problem here. Standard SDL_ttf will install SDL_ttf.h into the SDL folder. 
#There's no option in the build scripts to copy into a different ports inst/include so 
# instead I'm abusing the fact that INSTALLED_HDRS and HDR_DIRECTORY aren't mutually exclusive.
INSTALLED_HDRS =        SDL_ttf.h
HDR_DIRECTORY =         ../../../include/SDL
HDR_INSTDIR =           SDL

#KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk
