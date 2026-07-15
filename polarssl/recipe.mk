# Port Metadata
polarssl_PORTVERSION =       1.3.9

polarssl_MAINTAINER =        Damian Parrino <bucanero@users.noreply.github.com>
polarssl_LICENSE =           GPL2
polarssl_SHORT_DESC =        A Secure Socket Layer library.

# This port uses CMake.
polarssl_PORT_BUILD =        cmake

# What files we need to download, and where from.
polarssl_DOWNLOAD_URL  =     https://src.fedoraproject.org/repo/pkgs/polarssl/polarssl-1.3.9-gpl.tgz/48af7d1f0d5de512cbd6dacf5407884c/polarssl-1.3.9-gpl.tgz
polarssl_DOWNLOAD_SHA256 =   d3605afc28ed4b7d1d9e3142d72e42855e4a23c07c951bbb0299556b02d36755

# Set cmake build settings
polarssl_CMAKE_ARGS =        -DENABLE_TESTING=FALSE -DENABLE_PROGRAMS=FALSE -DCMAKE_POLICY_VERSION_MINIMUM=3.5
