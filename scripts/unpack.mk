# kos-ports ##version##
#
# scripts/unpack.mk
# Copyright (C) 2015 Lawrence Sebald
#

unpack: fetch
	@if [ -d "build" ] ; then \
		rm -rf build ; \
	fi

	@mkdir build

	@if [ -n "${DOWNLOAD_FILES}" ]; then \
		cd build ; \
		if [ -n "${EXTRACT_DIR}" ] ; then \
			mkdir -p "${EXTRACT_DIR}" ; \
		fi ; \
		for _file in "${DOWNLOAD_FILES}"; do \
			echo "Unpacking $$_file ..." ; \
			case "$$_file" in \
				*.zip) \
					if [ -n "${EXTRACT_DIR}" ] ; then \
						unzip -q "../dist/$$_file" -d "${EXTRACT_DIR}" ; \
					else \
						unzip -q "../dist/$$_file" ; \
					fi ;; \
				*) \
					if [ -n "${EXTRACT_DIR}" ] ; then \
						tar xf "../dist/$$_file" -C "${EXTRACT_DIR}" ; \
					else \
						tar xf "../dist/$$_file" ; \
					fi ;; \
			esac ; \
		done ; \
	else \
		cd build ; \
		echo "Copying SCM checkout of ${PORTNAME} ..." ; \
		cp -r ../dist/${PORTNAME}-${PORTVERSION} . ; \
	fi

copy-kos-files:
	@echo "Copying KOS files..."
	@cd build ; \
	if [ -z "${DISTFILE_DIR}" ] ; then \
		cd ${PORTNAME}-${PORTVERSION} ; \
	else \
		cd ${DISTFILE_DIR} ; \
	fi ; \
	for _file in ${KOS_DISTFILES}; do \
		cp "../../files/$$_file" . ; \
	done
