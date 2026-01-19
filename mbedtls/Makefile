# Port Metadata
PORTNAME =          mbedtls
PORTVERSION =       3.6.5

MAINTAINER =        Donald Haase
LICENSE =           Apache 2.0 OR GPL 2.0 or later
SHORT_DESC =        An open source TLS library.

PORT_BUILD =        cmake

# What files we need to download, and where from.
GIT_REPOSITORY =    https://github.com/Mbed-TLS/mbedtls.git
GIT_BRANCH =        v$(PORTVERSION)
TARGET =            lib$(PORTNAME).a

HDR_DIRECTORY =     include/mbedtls

NOCOPY_TARGET =     1

CMAKE_ARGS = -DENABLE_TESTING=OFF -DENABLE_PROGRAMS=OFF 

PREBUILD = mbedtls_prebuild
PREINSTALL = mbedtls_preinstall

include ${KOS_PORTS}/scripts/kos-ports.mk

# Copy in custom config file, then do the submodule updating
mbedtls_prebuild:
	cp files/mbedtls_config.h build/$(PORTNAME)-$(PORTVERSION)/include/mbedtls/; \
    cd build/$(PORTNAME)-$(PORTVERSION)/; git submodule update --init; cd ../../;

# Copy all lib files, then take care of removing then linking the extra libs that get built.
mbedtls_preinstall:
	mkdir -p inst/lib ; cp build/$(PORTNAME)-$(PORTVERSION)/library/*.a inst/lib; \
    rm -f ${KOS_PORTS}/lib/libmbedx509.a ; rm -f ${KOS_PORTS}/lib/libmbedcrypto.a ; \
    ln -s ${KOS_PORTS}/${PORTNAME}/inst/lib/libmbedx509.a ${KOS_PORTS}/lib/libmbedx509.a ; \
    ln -s ${KOS_PORTS}/${PORTNAME}/inst/lib/libmbedcrypto.a ${KOS_PORTS}/lib/libmbedcrypto.a ; 