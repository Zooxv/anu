#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch aosp_juice-userdebug
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
make bacon -j8 &
sleep 90m
kill %1
ccache -s
