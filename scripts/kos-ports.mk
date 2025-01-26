# kos-ports ##version##
#
# scripts/kos-ports.mk
# Copyright (C) 2015 Lawrence Sebald
#

# Grand central station for all the various sub-Makefiles.

all:
	@echo "Please build your port with 'make install clean'."

include ${KOS_PORTS}/config.mk

include ${KOS_PORTS}/scripts/setup.mk
include ${KOS_PORTS}/scripts/download.mk
include ${KOS_PORTS}/scripts/unpack.mk
include ${KOS_PORTS}/scripts/clean.mk
include ${KOS_PORTS}/scripts/build.mk
include ${KOS_PORTS}/scripts/version.mk
include ${KOS_PORTS}/scripts/precision.mk
include ${KOS_PORTS}/scripts/depends.mk
include ${KOS_PORTS}/scripts/uninstall.mk
include ${KOS_PORTS}/scripts/portinfo.mk
include ${KOS_PORTS}/scripts/validate.mk
