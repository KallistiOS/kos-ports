# Port Metadata
libyaml_PORTVERSION =       0.2.5

libyaml_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
libyaml_LICENSE =           MIT (see License in the source distribution)
libyaml_SHORT_DESC =        A C library for parsing and emitting YAML

# This port uses the autotools scripts that are included with the distfiles.
libyaml_PORT_BUILD =        autotools

# What files we need to download, and where from.
libyaml_DOWNLOAD_URL =      https://github.com/yaml/libyaml/releases/download/${libyaml_PORTVERSION}/yaml-${libyaml_PORTVERSION}.tar.gz
libyaml_DOWNLOAD_SHA256 =   c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4
