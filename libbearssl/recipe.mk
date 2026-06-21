# Port Metadata
libbearssl_PORTVERSION =       0.6

libbearssl_MAINTAINER =        Donald Haase
libbearssl_LICENSE =           MIT License
libbearssl_SHORT_DESC =        BearSSL is an implementation of the SSL/TLS protocol (RFC 5246) written in C.

# What files we need to download, and where from.
libbearssl_DOWNLOAD_SITE =     https://www.bearssl.org/
libbearssl_DOWNLOAD_FILE =     bearssl-${libbearssl_PORTVERSION}.tar.gz
libbearssl_DOWNLOAD_SHA256 =   6705bba1714961b41a728dfc5debbe348d2966c117649392f8c8139efc83ff14

libbearssl_TARGET =            build/libbearssl.a
libbearssl_HDR_DIRECTORY =     inc

libbearssl_KOS_MAKEFILE =      Makefile
libbearssl_MAKE_TARGET =       lib
