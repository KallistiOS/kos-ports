# kos-ports ##version##
#
# scripts/build.mk
# Copyright (C) 2015 Lawrence Sebald
#

KOS_MAKEFILE ?= KOSMakefile.mk

build-stamp: fetch validate-dist unpack copy-kos-files $(PREBUILD)
ifeq ($(PORT_BUILD), autotools)
	@if [ -z "${DISTFILE_DIR}" ] ; then \
		cd build/${PORTNAME}-${PORTVERSION} ; \
	else \
		cd build/${DISTFILE_DIR} ; \
	fi ; \
	CC=kos-cc ${CONFIGURE_DEFS} ./configure --prefix=${KOS_PORTS}/${PORTNAME}/inst --host=${AUTOTOOLS_HOST} ${CONFIGURE_ARGS} ; \
	$(MAKE) ${MAKE_TARGET} ;
else ifeq ($(PORT_BUILD), cmake)
	@if [ -z "${DISTFILE_DIR}" ] ; then \
		cd build/${PORTNAME}-${PORTVERSION} ; \
	else \
		cd build/${DISTFILE_DIR} ; \
	fi ; \
	if [ -z "${CMAKE_OUTSOURCE}" ] ; then \
		p=. ; \
	else \
		mkdir build ; cd build ; \
		p=.. ; \
	fi ; \
	kos-cmake -DCMAKE_INSTALL_INCLUDEDIR=${KOS_PORTS}/${PORTNAME}/inst/include \
		-DCMAKE_INSTALL_LIBDIR=${KOS_PORTS}/${PORTNAME}/inst/lib $$p ${CMAKE_ARGS} ; \
	cmake --build . -t $(or ${MAKE_TARGET},all) ;
else
	@if [ -z "${DISTFILE_DIR}" ] ; then \
		$(MAKE) -C build/${PORTNAME}-${PORTVERSION} -f ${KOS_MAKEFILE} ; \
	else \
		$(MAKE) -C build/${DISTFILE_DIR} -f ${KOS_MAKEFILE} ; \
	fi
endif
	touch build-stamp

install: setup-check abi-check depends-check
	@if [ -f "${KOS_PORTS}/lib/.kos-ports/${PORTNAME}" ] ; then \
		installed_version=`cat "${KOS_PORTS}/lib/.kos-ports/${PORTNAME}"` ; \
		if [ "$$installed_version" = "${PORTVERSION}" ] ; then \
			if [ -f "${KOS_PORTS}/lib/.kos-ports/${PORTNAME}.hash" ] ; then \
				echo "${PORTNAME} version ${PORTVERSION} is already installed." ; \
				echo "To force reinstall, run: make uninstall && make install" ; \
				echo "To check for updates, run: make update" ; \
				exit 0 ; \
			fi ; \
		fi ; \
	fi ; \
	$(MAKE) force-install store-hash

force-install: build-stamp $(PREINSTALL)
	@if [ ! -d "inst" ] ; then \
		mkdir inst ; \
	fi

	@cd inst ; \
	if [ ! -d "lib" ] ; then \
		mkdir lib ; \
	fi ; \
	if [ ! -d "include" ] ; then \
		mkdir include ; \
	fi

	@echo "Installing..."
	@cd build ; \
	if [ -z "${DISTFILE_DIR}" ] ; then \
		cd ${PORTNAME}-${PORTVERSION} ; \
	else \
		cd ${DISTFILE_DIR} ; \
	fi ; \
	if [ -z "${NOCOPY_TARGET}" ] ; then \
		cp ${TARGET} ../../inst/lib ; \
	fi ; \
	for _file in ${INSTALLED_HDRS}; do \
		cp $$_file ../../inst/include ; \
	done ; \
	if [ -n "${HDR_DIRECTORY}" ] ; then \
		cp -R ${HDR_DIRECTORY}/. ../../inst/include ; \
	fi ; \
	if [ -n "${EXAMPLES_DIR}" ] ; then \
		cp -R ${EXAMPLES_DIR}/. ../../inst/examples ; \
	fi

	@if [ -n "${HDR_COMDIR}" ] ; then \
		mkdir -p ${KOS_PORTS}/include/${HDR_COMDIR} ; \
		for _file in ${KOS_PORTS}/${PORTNAME}/inst/include/*; do \
			rm -f ${KOS_PORTS}/include/${HDR_COMDIR}/`basename $$_file` ; \
			ln -s $$_file ${KOS_PORTS}/include/${HDR_COMDIR} ; \
		done ; \
	elif [ -n "${HDR_INSTDIR}" ] ; then \
		rm -f ${KOS_PORTS}/include/${HDR_INSTDIR} ; \
		ln -s ${KOS_PORTS}/${PORTNAME}/inst/include ${KOS_PORTS}/include/${HDR_INSTDIR} ; \
	elif [ -n "${HDR_FULLDIR}" ] ; then \
		rm -f ${KOS_PORTS}/include/${HDR_FULLDIR} ; \
		ln -s ${KOS_PORTS}/${PORTNAME}/inst/include/${HDR_FULLDIR} ${KOS_PORTS}/include/${HDR_FULLDIR} ; \
	else \
		rm -f ${KOS_PORTS}/include/${PORTNAME} ; \
		ln -s ${KOS_PORTS}/${PORTNAME}/inst/include ${KOS_PORTS}/include/${PORTNAME} ; \
	fi

	@rm -f ${KOS_PORTS}/lib/${TARGET}
	@ln -s ${KOS_PORTS}/${PORTNAME}/inst/lib/${TARGET} ${KOS_PORTS}/lib/${TARGET}

	@rm -f ${KOS_PORTS}/examples/${PORTNAME}

	@if [ -n "${EXAMPLES_DIR}" ] ; then \
		ln -s ${KOS_PORTS}/${PORTNAME}/inst/examples ${KOS_PORTS}/examples/${PORTNAME} ; \
	fi

	@echo "Marking ${PORTNAME} ${PORTVERSION} as installed."
	@echo "${PORTVERSION}" > "${KOS_PORTS}/lib/.kos-ports/${PORTNAME}"

# Store git hash after successful build
store-hash:
	@if [ -n "${GIT_REPOSITORY}" ] ; then \
		git_dir="build/${PORTNAME}-${PORTVERSION}" ; \
		if [ -d "$$git_dir" ] ; then \
			cd "$$git_dir" ; \
			if [ -n "${GIT_BRANCH}" ] ; then \
				echo "Checking specified branch: ${GIT_BRANCH}" ; \
				git checkout ${GIT_BRANCH} > /dev/null 2>&1 ; \
			else \
				if git show-ref --verify --quiet refs/heads/main ; then \
					echo "Using default branch: main" ; \
					git checkout main > /dev/null 2>&1 ; \
				elif git show-ref --verify --quiet refs/heads/master ; then \
					echo "Using default branch: master" ; \
					git checkout master > /dev/null 2>&1 ; \
				fi ; \
			fi ; \
			current_hash=`git rev-parse HEAD` ; \
			mkdir -p ${KOS_PORTS}/lib/.kos-ports ; \
			echo "$$current_hash" > ${KOS_PORTS}/lib/.kos-ports/${PORTNAME}.hash ; \
			echo "Stored git hash: $$current_hash" ; \
		fi ; \
	fi
