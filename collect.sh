#!/bin/bash

cd /tmp/rom

. build/envsetup.sh

export CCACHE_DIR=/tmp/ccache

export CCACHE_EXEC=$(which ccache)

export USE_CCACHE=1

ccache -M 20G

ccache -o compression=true

ccache -z

$lunch

$make -j8 &

sleep 105m

kill %

ccache -s
