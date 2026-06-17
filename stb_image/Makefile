# Port Metadata
PORTNAME    = stb_image
PORTVERSION = 2.29

MAINTAINER  = Jason Rost (OniEnzeru)
LICENSE     = Public Domain
SHORT_DESC  = Single header library for image loading supporting many common formats.
ARCHS_SUPPORTED =   dreamcast gamecube

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
DOWNLOAD_SITE   = https://raw.githubusercontent.com/nothings/stb/master/
# Format KOS-PORTS wants to work with
DOWNLOAD_FILES  = ${PORTNAME}-${PORTVERSION}.tar.gz
# Actual downloaded file into dist ( we will package and tar this for compat )
DOWNLOAD_FILESB = stb_image.h

TARGET          = libstb_image.a
INSTALLED_HDRS  = stb_image.h
HDR_INSTDIR     = stb_image

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES   = KOSMakefile.mk stb_image.cpp

include ${KOS_PORTS}/scripts/kos-ports.mk

fetch:
	@if [ ! -d "dist" ]; then \
		mkdir dist ; \
	fi

	@cd dist ; \
	for _file in ${DOWNLOAD_FILESB}; do \
		if [ ! -f "$$_file" ] ; then \
			echo "fetchB"; \
			echo "Fetching $$_file from ${DOWNLOAD_SITE} ..." ; \
			file="${DOWNLOAD_SITE}/$$_file" ; \
			${FETCH_CMD} $$file ; \
		fi ; \
		mkdir -p ${PORTNAME}-${PORTVERSION}; \
		mv ${DOWNLOAD_FILESB} ${PORTNAME}-${PORTVERSION}/ ; \
		tar -czvf ${PORTNAME}-${PORTVERSION}.tar.gz ${PORTNAME}-${PORTVERSION} ; \
	done
# Create proper directory structure for the .tar.gz and move header inside
# Tar the downloaded file so that KOS flags know what to do with the single header
