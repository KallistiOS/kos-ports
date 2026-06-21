# KallistiOS ##version##
#
# KOS-ports Makefile
# Copyright (C) 2025 Paul Cercueil

# Include the packages recipes
#include $(KOS_PORTS)/*/recipe.mk

# Get a list of the sub-directories that contain a recipe.mk file
SUBDIRS := $(foreach each,$(wildcard ${KOS_PORTS}/*),$(if $(wildcard ${each}/recipe.mk),${each},) )
PACKAGES := $(foreach p,${SUBDIRS},$(notdir $p))

# Get a list of the sub-directories that failed to build
FAILED_PACKAGES = $(sort $(foreach p,${PACKAGES},$(if $(wildcard ${KOS_PORTS}/${p}/build/${${p}_PORTVERSION}/.stamp_installed),,${p})))

.PHONY: all all_nested failed clean distclean

all:
	-$(MAKE) -k -C ${KOS_PORTS} all_nested
	-@$(MAKE) --no-print-directory -C ${KOS_PORTS} failed

all_nested: $(foreach s,${SUBDIRS},$(notdir ${s}))

failed:
	@echo "Failed packages: ${FAILED_PACKAGES}"

clean:
	-rm -rf $(foreach s,${SUBDIRS},${s}/build)

distclean: clean
	-rm -rf sysroot

SYSROOT := ${KOS_PORTS}/sysroot
PKG_CONFIG_ENV := PKG_CONFIG_LIBDIR=${SYSROOT}/lib/pkgconfig:${SYSROOT}/share/pkgconfig PKG_CONFIG_SYSROOT_DIR=${SYSROOT}
BUILD_ENV := CC=kos-cc RANLIB=kos-ranlib AR=kos-ar

# Include the defaults
include ${KOS_PORTS}/config.mk

# Include the recipes
include $(KOS_PORTS)/*/recipe.mk

define BUILD_RULE

# Default values
${2}_MAKE_TARGET ?= install
${2}_PORT_BUILD ?= manual
${2}_REQUIRES_ABI ?= any
${2}_KOS_MAKEFILE ?= KOSMakefile.mk
${2}_FETCH_CMD ?= ${FETCH_CMD}
${2}_UNPACK_CMD ?= ${UNPACK_CMD}

${2}_DEP_STAMPS = $$(foreach dep,$${${2}_DEPENDENCIES},$(abspath ${KOS_PORTS}/$${dep}/build/$${$${dep}_PORTVERSION}/.stamp_installed))
${2}_BUILD_DEPS = $${${2}_DEP_STAMPS} ${1}/.stamp_fetched ${1}/.stamp_abi_checked

${2}_DISTFILE_DIR = ${1}/${2}-$${${2}_PORTVERSION}

${1}/.stamp_abi_checked:
ifeq ($${${2}_REQUIRES_ABI},any)
	@echo "${2} is compatible with any floating-point ABI."
else
	@case " $${${2}_REQUIRES_ABI} " in *" $(KOS_SH4_PRECISION) "*) \
		echo "${2} is compatible with the ${KOS_SH4_PRECISION} floating-point ABI."; \
		;; \
	*) \
		echo "${2} is not compatible with the ${KOS_SH4_PRECISION} floating-point ABI!"; \
		echo "Change the KOS_SH4_PRECISION setting in your environ.sh to one of the following: $${${2}_REQUIRES_ABI}"; \
		echo "Then rebuild KOS and try again."; \
		exit 1; \
		;; \
	esac
endif
	touch $$@

${1}/.stamp_downloaded: ${1}/$${${2}_DOWNLOAD_FILE}
	@if [ -n "$${${2}_DOWNLOAD_SHA256}" -a "$${${2}_DOWNLOAD_SHA256}" != "$$(firstword $$(shell sha256sum $$<))" ] ; then \
		echo "Downloaded file $${${2}_DOWNLOAD_FILE} does not match our SHA256. Got $$(shell sha256sum $$<)" ; \
		exit 1 ; \
	fi ; \
	touch $$@

${1}/.stamp_nodownload:
	mkdir -p $${${2}_DISTFILE_DIR}
	touch $$@

${1}/$${${2}_DOWNLOAD_FILE}:
	mkdir -p ${1}
	@echo "Fetching $${${2}_DOWNLOAD_FILE} from $${${2}_DOWNLOAD_SITE} ..." ; \
	(cd ${1} ; $${${2}_FETCH_CMD} "$${${2}_DOWNLOAD_SITE}/$${${2}_DOWNLOAD_FILE}")

${1}/.stamp_extracted: ${1}/$${${2}_DOWNLOAD_FILE} ${1}/.stamp_downloaded
	mkdir -p $${${2}_DISTFILE_DIR}
	(cd $${${2}_DISTFILE_DIR} ; $${${2}_UNPACK_CMD} $$< && touch $$@)

${1}/.stamp_fetched: ${1}/.stamp_$$(if $${${2}_DOWNLOAD_SITE},extracted,nodownload)
	if [ -d ${KOS_PORTS}/${2}/files ] ; then \
		cp ${KOS_PORTS}/${2}/files/* $${${2}_DISTFILE_DIR}/ ; \
	fi
	cd $${${2}_DISTFILE_DIR} ; \
	for _patch in $(wildcard ${KOS_PORTS}/${2}/patches/*) ; do \
		patch -p1 < $$$${_patch} ; \
	done
	touch $$@

${1}/.stamp_installed_autotools: $${${2}_BUILD_DEPS}
	cd $${${2}_DISTFILE_DIR} ; \
	${BUILD_ENV} ${PKG_CONFIG_ENV} ./configure $$(if $${${2}_CONFIGURE_NO_CACHE_FILE},,--cache-file=${KOS_PORTS}/config.${KOS_GCCVER}.cache) --prefix="" --host=${AUTOTOOLS_HOST} $${${2}_CONFIGURE_ARGS} && \
	DESTDIR=${SYSROOT} ${MAKE} $${${2}_MAKE_TARGET} && \
	touch $$@

${1}/.stamp_installed_cmake: $${${2}_BUILD_DEPS}
	mkdir -p $${${2}_DISTFILE_DIR}/build
	cd $${${2}_DISTFILE_DIR}/build ; \
	${BUILD_ENV} kos-cmake -DCMAKE_INSTALL_PREFIX="" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib $${${2}_CMAKE_ARGS} .. && \
	DESTDIR=${SYSROOT} cmake --build . -t $${${2}_MAKE_TARGET} && \
	touch $$@

${1}/.stamp_installed_manual: $${${2}_BUILD_DEPS}
	${MAKE} -C $${${2}_DISTFILE_DIR} -f $${${2}_KOS_MAKEFILE} $${${2}_MAKE_TARGET} ${BUILD_ENV}
	mkdir -p ${SYSROOT}/lib ${SYSROOT}/include/$${${2}_HDR_INSTDIR}
	for each in $${${2}_TARGET} ; do \
		install -m 644 $${${2}_DISTFILE_DIR}/$$$${each} ${SYSROOT}/lib ; \
	done ; \
	if [ "$${${2}_HDR_DIRECTORY}" ] ; then \
		cp -r $${${2}_DISTFILE_DIR}/$${${2}_HDR_DIRECTORY}/* ${SYSROOT}/include/$${${2}_HDR_INSTDIR}/ ; \
	fi ; \
	for each in $${${2}_INSTALLED_HDRS} ; do \
		install -m 644 $${${2}_DISTFILE_DIR}/$$$${each} ${SYSROOT}/include/$${${2}_HDR_INSTDIR} ; \
	done ; \
	touch $$@

${1}/.stamp_installed: ${1}/.stamp_installed_$${${2}_PORT_BUILD}
	touch $$@

.PHONY: ${2}

${2}: ${1}/.stamp_installed

endef

$(foreach p,${PACKAGES},$(eval $(call BUILD_RULE,$(abspath ${KOS_PORTS}/${p}/build/${${p}_PORTVERSION}),${p})))
