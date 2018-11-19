#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#rm -r $DIR/lib/

#curl -O https://dl.dropboxusercontent.com/u/29102565/lib.zip && \
#unzip lib.zip && \
#rm lib.zip

cd $DIR/lib/assimp
cmake -DCMAKE_CXX_FLAGS="-stdlib=libc++ -fvisibility-inlines-hidden" -DCMAKE_BUILD_TYPE=Release -DASSIMP_BUILD_STATIC_LIB=true