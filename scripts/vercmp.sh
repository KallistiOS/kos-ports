#!/usr/bin/env bash
# Copyright (C) 2010 Dennis Willamson
# License: CC BY-SA 3.0 (http://creativecommons.org/licenses/by-sa/3.0/)
# Obtained from:
#   http://stackoverflow.com/questions/4023830/bash-how-compare-two-strings-in-version-format

# The only modifications made were to remove the test code and to add the bit at
# the bottom to return back to the calling shell
# Returns 0 if the version numbers are identical, 1 if the first is greater than
# the second, 2 if the second is greater than the first.
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

vercomp $1 $2
exit $?
