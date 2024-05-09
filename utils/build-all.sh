#!/bin/sh
# kos-ports ##version##
#
# utils/build-all.sh
# Copyright (C) 2015 Lawrence Sebald
# Copyright (C) 2024 Andy Barajas
#

cd ${KOS_PORTS}
errors=""
error_count=0

for _dir in ${KOS_PORTS}/* ; do
    if [ -d "${_dir}" ] ; then
        if [ -f "${_dir}/Makefile" ] ; then
            echo "Checking if ${_dir} is installed and up-to-date..."
            ${KOS_MAKE} -C "${_dir}" version-check > /dev/null 2>&1
            rv=$?
            if [ "$rv" -eq 0 ] ; then
                echo "Building ${_dir}..."
                ${KOS_MAKE} -C "${_dir}" install clean
                rv=$?
                echo $rv
                if [ "$rv" -ne 0 ] ; then
                    echo "Error building ${_dir}."
                    errors="${errors}${_dir}: Build failed with return code ${rv}\n"
                    error_count=$((error_count + 1))
                fi
            else
                echo "${_dir} is already installed and up-to-date. Skipping."
            fi
        fi
    fi
done

if [ -n "$errors" ]; then
    echo "\n-------------------------------------------------"
    echo "$error_count error(s) occurred during the build process:"
    echo "$errors"
fi
