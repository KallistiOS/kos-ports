# KallistiOS ##version##
#
# KOS-ports Makefile
# Copyright (C) 2026 Paul Cercueil

$(if ${KOS_BASE},,$(error KallistiOS environment not found. Did you source environ.sh?))
$(if ${KOS_SYSROOT},,$(error KallistiOS sysroot not found. Make sure you are using v2.2.3 or newer.))

# Include the defaults
include ${KOS_PORTS}/config.mk

# Get a list of the sub-directories that contain a recipe.mk file
SUBDIRS := $(foreach each,$(wildcard ${KOS_PORTS}/*),$(if $(wildcard ${each}/recipe.mk),${each},) )
PACKAGES := $(foreach p,${SUBDIRS},$(notdir $p))

.PHONY: all all_nested failed clean

all:
	-$(MAKE) -k -C ${KOS_PORTS} all_nested
	-@$(MAKE) --no-print-directory -C ${KOS_PORTS} failed

PKG_CONFIG_ENV := PKG_CONFIG_LIBDIR=${KOS_SYSROOT}/lib/pkgconfig:${KOS_SYSROOT}/share/pkgconfig PKG_CONFIG_SYSROOT_DIR=${KOS_SYSROOT}
BUILD_ENV := CC=kos-cc RANLIB=kos-ranlib AR=kos-ar

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

${2}_DEP_STAMPS = $$(foreach dep,$${${2}_DEPENDENCIES},$(abspath ${KOS_PORTS}/$${dep}/build-${KOS_ARCH}/$${$${dep}_PORTVERSION}/.stamp_installed))
${2}_BUILD_DEPS = $${${2}_DEP_STAMPS} ${1}/.stamp_fetched ${1}/.stamp_abi_checked

${2}_DISTFILE_DIR = ${1}/${2}-$${${2}_PORTVERSION}

${2}_ARCH_SUPPORTED = $$(if $${${2}_ARCHS},$$(if $$(findstring ${KOS_ARCH},$${${2}_ARCHS}),${2}),${2})

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
	${BUILD_ENV} ${PKG_CONFIG_ENV} ./configure $$(if $${${2}_CONFIGURE_NO_CACHE_FILE},,--cache-file=${KOS_PORTS}/config.${KOS_GCCVER}.cache) --prefix="" --host=${KOS_CC_PREFIX} $${${2}_CONFIGURE_ARGS} && \
	DESTDIR=${KOS_SYSROOT} ${MAKE} $${${2}_MAKE_TARGET} && \
	touch $$@

${1}/.stamp_installed_cmake: $${${2}_BUILD_DEPS}
	mkdir -p $${${2}_DISTFILE_DIR}/build
	cd $${${2}_DISTFILE_DIR}/build ; \
	${BUILD_ENV} kos-cmake -DCMAKE_INSTALL_PREFIX="" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib $${${2}_CMAKE_ARGS} .. && \
	DESTDIR=${KOS_SYSROOT} cmake --build . -t $${${2}_MAKE_TARGET} && \
	touch $$@

${1}/.stamp_installed_manual: $${${2}_BUILD_DEPS}
	${MAKE} -C $${${2}_DISTFILE_DIR} -f $${${2}_KOS_MAKEFILE} $${${2}_MAKE_TARGET} ${BUILD_ENV} $${${2}_BUILD_ENV}
	mkdir -p ${KOS_SYSROOT}/lib ${KOS_SYSROOT}/include/$${${2}_HDR_INSTDIR}
	for each in $${${2}_TARGET} ; do \
		install -m 644 $${${2}_DISTFILE_DIR}/$$$${each} ${KOS_SYSROOT}/lib ; \
	done ; \
	if [ "$${${2}_HDR_DIRECTORY}" ] ; then \
		cp -r $${${2}_DISTFILE_DIR}/$${${2}_HDR_DIRECTORY}/* ${KOS_SYSROOT}/include/$${${2}_HDR_INSTDIR}/ ; \
	fi ; \
	for each in $${${2}_INSTALLED_HDRS} ; do \
		install -m 644 $${${2}_DISTFILE_DIR}/$$$${each} ${KOS_SYSROOT}/include/$${${2}_HDR_INSTDIR} ; \
	done ; \
	touch $$@

${1}/.stamp_installed: ${1}/.stamp_installed_$${${2}_PORT_BUILD}
	touch $$@

.PHONY: ${2} clean-${2} rebuild-${2}

${2}: $$(if $${${2}_ARCH_SUPPORTED},${1}/.stamp_installed)
	$$(if $${${2}_ARCH_SUPPORTED},,@echo "${2} is not supported for this platform - skipping.")

clean-${2}:
	-rm -rf ${KOS_PORTS}/${2}/build-${KOS_ARCH}

rebuild-${2}: clean-${2} ${2}

.NOTPARALLEL: rebuild-${2}

endef

$(foreach p,${PACKAGES},$(eval $(call BUILD_RULE,$(abspath ${KOS_PORTS}/${p}/build-${KOS_ARCH}/${${p}_PORTVERSION}),${p})))

# Get a list of the packages that are valid for our arch
ARCH_PACKAGES := $(foreach p,${PACKAGES},${${p}_ARCH_SUPPORTED})

# Get a list of the sub-directories that failed to build
FAILED_PACKAGES = $(sort $(foreach p,${ARCH_PACKAGES},$(if $(wildcard ${KOS_PORTS}/${p}/build-${KOS_ARCH}/${${p}_PORTVERSION}/.stamp_installed),,${p})))

all_nested: ${ARCH_PACKAGES}

failed:
	@echo "Failed packages: ${FAILED_PACKAGES}"

clean: $(foreach p,${ARCH_PACKAGES},clean-${p})
