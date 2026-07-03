# Port Metadata
miniaudio_PORTVERSION =       dev-0.12

miniaudio_MAINTAINER =        mackron
miniaudio_LICENSE =           Public Domain/MIT No Attribution
miniaudio_SHORT_DESC =        Audio playback and capture library written in C, in a single source file.

miniaudio_REQUIRES_ABI =      -m4-single

miniaudio_PORT_BUILD =        cmake

miniaudio_DEPENDENCIES =      opusfile

miniaudio_GIT_HASH =          a55d2e7eb8c251aa8e2277eb0c380a393140a270
miniaudio_DOWNLOAD_URL =      https://github.com/mackron/miniaudio/archive/${miniaudio_GIT_HASH}.tar.gz

miniaudio_CMAKE_ARGS =       -DMINIAUDIO_ENABLE_DREAMCAST=ON
