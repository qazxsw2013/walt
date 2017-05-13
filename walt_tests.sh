#!/bin/bash

set -e
set -x


git submodule init
git submodule update

cd $(dirname ${BASH_SOURCE[0]})
cd ./WebAssembly/spec/interpreter
make

cd ../../../
ls
# TODO: edit the python script to take an inputDir instead of ownDir always
cp ./WebAssembly/spec/test/core/run.py ./test/
./test/run.py --wasm `pwd`/WebAssembly/spec/interpreter/wasm
