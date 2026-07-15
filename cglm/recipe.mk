# Port Metadata
cglm_PORTVERSION =       1.0.0

cglm_MAINTAINER =        Donald Haase
cglm_LICENSE =           MIT
cglm_SHORT_DESC =        Highly optimized 2D|3D math library, also known as OpenGL Mathematics (glm) for `C`

# This port uses CMake.
cglm_PORT_BUILD =        cmake

# What files we need to download, and where from.
cglm_GIT_REPO =          https://github.com/recp/cglm
cglm_GIT_HASH =          46f46e5dcb84bc5bfcc07675f026077272704f0c
cglm_DOWNLOAD_URL =      ${cglm_GIT_REPO}/archive/${cglm_GIT_HASH}.tar.gz

# cmake setup work.
cglm_CMAKE_ARGS =        -DCGLM_STATIC=ON -Wno-dev -DCMAKE_C_FLAGS="-Wno-unused-parameter"
