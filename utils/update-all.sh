#!/bin/sh
# kos-ports ##version##
#
# utils/update-all.sh
# Copyright (C) 2025 Panos Georgiadis
#

cd ${KOS_PORTS}
errors=""
error_count=0
update_count=0
uptodate_count=0
skip_count=0
updated_ports=""
failed_ports=""

for _dir in ${KOS_PORTS}/* ; do
    if [ -d "${_dir}" ] ; then
        if [ -f "${_dir}/Makefile" ] ; then
            portname=$(basename "${_dir}")
            if [ -f "${KOS_PORTS}/lib/.kos-ports/${portname}" ] ; then
                echo "Checking updates for ${_dir}..."
                ${KOS_MAKE} -C "${_dir}" update > update.log 2>&1
                rv=$?
                cat update.log
                if [ "$rv" -eq 0 ] ; then
                    # Check if the port was actually updated or just checked
                    if grep -q "is up to date" update.log || \
                       grep -q "No changes detected" update.log || \
                       grep -q "version .* is up to date" update.log || \
                       grep -q "is already installed" update.log ; then
                        uptodate_count=$((uptodate_count + 1))
                    else
                        # Only count as updated if we see actual update messages
                        if grep -q "has new changes in repository" update.log || \
                           grep -q "version .* is available" update.log ; then
                            update_count=$((update_count + 1))
                            updated_ports="${updated_ports}${portname}\n"
                        else
                            uptodate_count=$((uptodate_count + 1))
                        fi
                    fi
                else
                    if [ "$rv" -eq 1 ] && [ -f "${KOS_PORTS}/lib/.kos-ports/${portname}" ] ; then
                        # Exit code 1 with installed port means "no updates available"
                        uptodate_count=$((uptodate_count + 1))
                        echo "${_dir} is up to date."
                    else
                        echo "Error updating ${_dir}."
                        errors="${errors}${_dir}: Update failed with return code ${rv}\n"
                        error_count=$((error_count + 1))
                        failed_ports="${failed_ports}${portname}\n"
                    fi
                fi
                rm -f update.log
            else
                echo "Skipping ${_dir} (not installed)"
                skip_count=$((skip_count + 1))
            fi
        fi
    fi
done

echo "\n-------------------------------------------------"
echo "Status Summary:"
if [ "$update_count" -gt 0 ] ; then
    echo "✓ Updated: $update_count port(s)"
    echo "  Updated ports:"
    printf "$updated_ports" | while read port; do
        echo "    - $port"
    done
fi
if [ "$uptodate_count" -gt 0 ] ; then
    echo "✓ Up to date: $uptodate_count port(s)"
fi
if [ "$skip_count" -gt 0 ] ; then
    echo "- Skipped: $skip_count port(s) (not installed)"
fi
if [ -n "$errors" ]; then
    echo "✗ Failed: $error_count port(s):"
    printf "$failed_ports" | while read port; do
        echo "    - $port"
    done
    echo "$errors"
fi
exit $error_count 