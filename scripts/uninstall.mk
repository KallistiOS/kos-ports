# kos-ports ##version##
#
# scripts/uninstall.mk
# Copyright (C) 2015 Lawrence Sebald
#

uninstall:
	@if [ -f ${KOS_PORTS}/lib/.kos-ports/${PORTNAME} ] ; then \
		echo "Uninstalling ${PORTNAME}..." ; \
		rm -f ${KOS_PORTS}/lib/.kos-ports/${PORTNAME} ; \
		rm -f ${KOS_PORTS}/lib/${TARGET} ; \
		if [ -n "${HDR_COMDIR}" ] ; then \
			for _file in ${KOS_PORTS}/${PORTNAME}/inst/include/*; do \
				rm -f ${KOS_PORTS}/include/${HDR_COMDIR}/`basename $$_file` ; \
			done ; \
			if [ -z "$$(ls -A ${KOS_PORTS}/include/${HDR_COMDIR})" ] ; then \
				rm -rf ${KOS_PORTS}/include/${HDR_COMDIR} ; \
			fi ; \
		elif [ -n "${HDR_INSTDIR}" ] ; then \
			rm -f ${KOS_PORTS}/include/${HDR_INSTDIR} ; \
		elif [ -n "${HDR_FULLDIR}" ] ; then \
			rm -f ${KOS_PORTS}/include/${HDR_FULLDIR} ; \
		else \
			rm -f ${KOS_PORTS}/include/${PORTNAME} ; \
		fi ; \
		rm -fr inst ; \
		if [ -n "${EXAMPLES_SYMLINK}" ] ; then \
			rm -f ${KOS_BASE}/examples/${KOS_ARCH}/${PORTNAME} ; \
		fi ; \
		echo "Uninstalled ${PORTNAME}." ; \
		echo "WARNING: Dependency checking not done, any dependent ports will be broken." ; \
	else \
		echo "${PORTNAME} does not appear to be installed." ; \
		exit 1 ; \
	fi
