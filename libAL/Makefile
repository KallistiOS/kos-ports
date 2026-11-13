# Port Metadata
PORTNAME =          libAL
PORTVERSION =       1.0.0

MAINTAINER =        Luke Benstead <kazade@gmail.com>
LICENSE =           MIT License
SHORT_DESC =        OpenAL implementation for KOS

PORT_BUILD =        cmake

# What files we need to download, and where from.
GIT_REPOSITORY =    https://gitlab.com/simulant/aldc.git

TARGET =            libAL.a
INSTALLED_HDRS =    include/AL/al.h include/AL/alc.h include/AL/alut.h
HDR_COMDIR =        AL

CMAKE_ARGS =        -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DBUILD_SAMPLES=OFF

include ${KOS_PORTS}/scripts/kos-ports.mk
