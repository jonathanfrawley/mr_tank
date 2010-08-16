#!/bin/bash
PROJECT_ROOT=`pwd`
BIN_DIR=$PROJECT_ROOT/bin
SRC_DIR=$PROJECT_ROOT/src
BUILD_DIR=$PROJECT_ROOT/build

cd $SRC_DIR
haxe $BUILD_DIR/compile.hxml
#if [ $? ]
#then
#	echo "Launching web page"
#	firefox $BIN_DIR/mr_tank.html
#fi
