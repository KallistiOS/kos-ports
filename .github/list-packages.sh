#!/bin/sh

cd `dirname $0`/..

ls -1 */recipe.mk |awk -F'/' '{gsub(/\.mk$/, "", $2); print "{\"package\":\""$1"\"}"}' | jq -R -s -c 'split("\n")[:-1]'
