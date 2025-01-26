# Port Metadata
PORTNAME =          libbearssl
PORTVERSION =       1.0.0

MAINTAINER =        Donald Haase
LICENSE =           MIT License
SHORT_DESC =        BearSSL is an implementation of the SSL/TLS protocol (RFC 5246) written in C.

KOS_MAKEFILE = Makefile

# What files we need to download, and where from.
GIT_REPOSITORY =    https://www.bearssl.org/git/BearSSL
TARGET =            libbearssl.a
HDR_DIRECTORY =     inc

# Add a pre-install target to get the built library where we expect it.
PREINSTALL = bearssl_preinstall

MAKE_TARGET =       all install

include ${KOS_PORTS}/scripts/kos-ports.mk
bearssl_preinstall:
	cp build/${PORTNAME}-${PORTVERSION}/build/${TARGET} build/${PORTNAME}-${PORTVERSION}
