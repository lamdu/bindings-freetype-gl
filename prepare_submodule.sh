#!/bin/bash

set -eu

if [ -e .git ]
then
    git submodule update --init --recursive
    exit 0
fi

curl -L https://github.com/lamdu/freetype-gl/archive/d5bc473468422f2cc536bab6e6a87a9aabb7ea07.tar.gz > freetype-gl-submodule.tar.gz
tar xvzf freetype-gl-submodule.tar.gz
mkdir -p freetype-gl
mv freetype-gl-d5bc473468422f2cc536bab6e6a87a9aabb7ea07/* freetype-gl/
rm freetype-gl-submodule.tar.gz
rm -r freetype-gl-d5bc473468422f2cc536bab6e6a87a9aabb7ea07
