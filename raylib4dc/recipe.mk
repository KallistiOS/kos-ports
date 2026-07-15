# Port Metadata
raylib4dc_PORTVERSION =       5.5.0

raylib4dc_MAINTAINER =        Andress Barajas
raylib4dc_LICENSE =           zlib License - http://opensource.org/licenses/Zlib
raylib4dc_SHORT_DESC =        raylib is a simple and easy-to-use library to enjoy videogames programming.

raylib4dc_DEPENDENCIES =      libGL

# What files we need to download, and where from.
raylib4dc_GIT_REPO =          https://github.com/raylib4Consoles/raylib
raylib4dc_GIT_HASH =          f1cfd6da839f521e5a6fd84c9783540f8403b203
raylib4dc_DOWNLOAD_URL =      ${raylib4dc_GIT_REPO}/archive/${raylib4dc_GIT_HASH}.tar.gz

raylib4dc_TARGET =            src/libraylib.a
raylib4dc_INSTALLED_HDRS =    src/raylib.h src/raymath.h src/rlgl.h
raylib4dc_HDR_INSTDIR =       raylib
