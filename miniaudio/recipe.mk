# Port Metadata
miniaudio_PORTVERSION =       dev-0.12

miniaudio_MAINTAINER =        mackron
miniaudio_LICENSE =           Public Domain/MIT No Attribution
miniaudio_SHORT_DESC =        Audio playback and capture library written in C, in a single source file.

miniaudio_REQUIRES_ABI =      -m4-single

miniaudio_PORT_BUILD =        cmake

miniaudio_DEPENDENCIES =      opusfile

miniaudio_GIT_REPO =          https://github.com/mackron/miniaudio
miniaudio_GIT_HASH =          04429abf58dfd79b161e70fbd01e62d7a61cc760
miniaudio_GIT_BRANCH =        ${miniaudio_PORTVERSION}
miniaudio_DOWNLOAD_URL =      ${miniaudio_GIT_REPO}/archive/${miniaudio_GIT_HASH}.tar.gz

miniaudio_CMAKE_ARGS =       -DMINIAUDIO_ENABLE_DREAMCAST=ON
