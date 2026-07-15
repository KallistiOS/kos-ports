# Port Metadata
libtsunami_PORTVERSION =       2.0.0

libtsunami_MAINTAINER =        Nobody
libtsunami_LICENSE =           KOS License
libtsunami_SHORT_DESC =        C++ "scene graph" wrapper around libparallax

libtsunami_DEPENDENCIES =      libparallax

# What files we need to download, and where from.
libtsunami_GIT_REPO =          https://github.com/KallistiOS/libtsunami
libtsunami_GIT_HASH =          f1fa63b1b64b38ffdbf107037b446388c91b4e72
libtsunami_DOWNLOAD_URL =      ${libtsunami_GIT_REPO}/archive/${libtsunami_GIT_HASH}.tar.gz

libtsunami_TARGET =            libtsunami.a
libtsunami_HDR_DIRECTORY =     include
libtsunami_HDR_INSTDIR =       tsu
