# kos-ports ##version##
#
# scripts/version.mk
# Copyright (C) 2015 Lawrence Sebald
#

# Update target that handles both git and version-based ports
update:
	@if [ -f ${KOS_PORTS}/lib/.kos-ports/${PORTNAME} ] ; then \
		if [ -n "${GIT_REPOSITORY}" ] ; then \
			if [ -f "${KOS_PORTS}/lib/.kos-ports/${PORTNAME}.hash" ] ; then \
				last_hash=`cat ${KOS_PORTS}/lib/.kos-ports/${PORTNAME}.hash` ; \
				echo "Last stored hash: $$last_hash" ; \
				tmp_dir=`mktemp -d` ; \
				max_retries=3 ; \
				retry_count=1 ; \
				while [ $$retry_count -le $$max_retries ] ; do \
					echo "Attempting to clone repository (attempt $$retry_count of $$max_retries)..." ; \
					git clone ${GIT_REPOSITORY} $$tmp_dir > /dev/null 2>&1 ; \
					if [ $$? -eq 0 ] ; then \
						break ; \
					fi ; \
					if [ $$retry_count -lt $$max_retries ] ; then \
						echo "Clone failed, retrying in 5 seconds..." ; \
						sleep 5 ; \
					fi ; \
					retry_count=$$((retry_count + 1)) ; \
				done ; \
				if [ $$retry_count -gt $$max_retries ] ; then \
					echo "Failed to clone repository after $$max_retries attempts." ; \
					echo "Please check your network connection and repository URL: ${GIT_REPOSITORY}" ; \
					rm -rf $$tmp_dir ; \
					exit 1 ; \
				fi ; \
				cd $$tmp_dir ; \
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
					else \
						echo "Error: No default branch (main or master) found in repository" ; \
						cd - > /dev/null ; \
						rm -rf $$tmp_dir ; \
						exit 1 ; \
					fi ; \
				fi ; \
				current_hash=`git rev-parse HEAD` ; \
				echo "Current repository hash: $$current_hash" ; \
				cd - > /dev/null ; \
				rm -rf $$tmp_dir ; \
				if [ "$$last_hash" = "$$current_hash" ] ; then \
					echo "${PORTNAME} is up to date with git repository. No changes detected." ; \
					exit 0 ; \
				else \
					echo "${PORTNAME} has new changes in repository. Rebuilding..." ; \
					cd ${KOS_PORTS} && $(MAKE) -C ${PORTNAME} clean install ; \
				fi ; \
			else \
				echo "${PORTNAME} is installed but no git hash is stored yet." ; \
				echo "Performing clean reinstall to ensure latest state..." ; \
				cd ${KOS_PORTS} && $(MAKE) -C ${PORTNAME} uninstall clean install ; \
			fi ; \
		else \
			installed_version=`cat ${KOS_PORTS}/lib/.kos-ports/${PORTNAME}` ; \
			${KOS_PORTS}/scripts/vercmp.sh $$installed_version ${PORTVERSION} ; \
			res=$$? ; \
			if [ "$$res" -eq "0" ] ; then \
				echo "${PORTNAME} version $$installed_version is up to date." ; \
				exit 0 ; \
			elif [ "$$res" -eq "1" ] ; then \
				echo "${PORTNAME} version $$installed_version is newer than ports version ${PORTVERSION}!" ; \
				echo "Ports collection might be out of sync. Please check for updates." ; \
				exit 1 ; \
			else \
				echo "${PORTNAME} version $$installed_version is installed, but version ${PORTVERSION} is available." ; \
				echo "Performing clean reinstall to update..." ; \
				cd ${KOS_PORTS} && $(MAKE) -C ${PORTNAME} uninstall clean install ; \
			fi ; \
		fi ; \
	else \
		echo "${PORTNAME} is not currently installed." ; \
		echo "Nothing to update. To install this port, run: make clean install" ; \
		exit 1 ; \
	fi

# Show dependencies for this port
show-deps:
	@if [ -n "${DEPENDENCIES}" ] ; then \
		echo "Dependencies for ${PORTNAME}:" ; \
		for _dep in ${DEPENDENCIES}; do \
			if [ -f "${KOS_PORTS}/lib/.kos-ports/$$_dep" ] ; then \
				printf "  ✓ %s (installed)\n" "$$_dep" ; \
			else \
				printf "  ✗ %s (not installed)\n" "$$_dep" ; \
			fi ; \
			if [ -f "${KOS_PORTS}/$$_dep/Makefile" ] ; then \
				cd "${KOS_PORTS}/$$_dep" && \
				subdeps=`${MAKE} print-deps 2>/dev/null` ; \
				if [ -n "$$subdeps" ] ; then \
					echo "    Sub-dependencies:" ; \
					for _subdep in $$subdeps; do \
						if [ -f "${KOS_PORTS}/lib/.kos-ports/$$_subdep" ] ; then \
							printf "      ✓ %s (installed)\n" "$$_subdep" ; \
						else \
							printf "      ✗ %s (not installed)\n" "$$_subdep" ; \
						fi ; \
					done ; \
				fi ; \
			fi ; \
		done ; \
	else \
		echo "${PORTNAME} has no dependencies beyond the base system." ; \
	fi

# Helper target to print dependencies
print-deps:
	@echo "${DEPENDENCIES}"
