# Port Metadata
mbedtls_PORTVERSION =       3.6.6

mbedtls_MAINTAINER =        Donald Haase
mbedtls_LICENSE =           Apache 2.0 OR GPL 2.0 or later
mbedtls_SHORT_DESC =        An open source TLS library.

mbedtls_PORT_BUILD =        cmake

# What files we need to download, and where from.
mbedtls_DOWNLOAD_URL =      https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-${mbedtls_PORTVERSION}/mbedtls-${mbedtls_PORTVERSION}.tar.bz2
mbedtls_DOWNLOAD_SHA256 =   8fb65fae8dcae5840f793c0a334860a411f884cc537ea290ce1c52bb64ca007a

mbedtls_CMAKE_ARGS = -DENABLE_TESTING=OFF -DENABLE_PROGRAMS=OFF -DMBEDTLS_FATAL_WARNINGS=OFF -DMBEDTLS_CONFIG_FILE=${KOS_PORTS}/mbedtls/files/mbedtls_config.h
