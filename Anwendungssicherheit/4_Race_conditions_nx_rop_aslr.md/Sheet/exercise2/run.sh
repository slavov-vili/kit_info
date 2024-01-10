#!/bin/bash
pushd .
cd "`dirname \"$0\"`"
chmod +x ld-linux-x86-64.so.2
LD_LIBRARY_PATH=. ./ld-linux-x86-64.so.2 ./server $@
popd
