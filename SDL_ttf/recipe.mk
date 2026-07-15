# Port Metadata
SDL_ttf_PORTVERSION =       1.2

SDL_ttf_MAINTAINER =        Donald Haase
SDL_ttf_LICENSE =           zlib License - http://opensource.org/licenses/Zlib
SDL_ttf_SHORT_DESC =        SDL TrueType font library

SDL_ttf_DEPENDENCIES =      SDL libbz2 zlib libpng freetype

SDL_ttf_PORT_BUILD =        autotools

# What files we need to download, and where from.
SDL_ttf_GIT_REPO =          https://github.com/libsdl-org/SDL_ttf
SDL_ttf_GIT_BRANCH =        SDL-1.2
SDL_ttf_GIT_HASH =          3c4233732b94ce08d5f6a868e597af39e13f8b23
SDL_ttf_DOWNLOAD_URL =      ${SDL_ttf_GIT_REPO}/archive/${SDL_ttf_GIT_HASH}.tar.gz
