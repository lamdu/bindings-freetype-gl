#!/bin/bash

git submodule update --init --recursive && exit 0

wget https://github.com/lamdu/freetype-gl/archive/d5bc473468422f2cc536bab6e6a87a9aabb7ea07.tar.gz
tar xvzf d5bc473468422f2cc536bab6e6a87a9aabb7ea07.tar.gz
mv freetype-gl-d5bc473468422f2cc536bab6e6a87a9aabb7ea07/* freetype-gl/
rm d5bc473468422f2cc536bab6e6a87a9aabb7ea07.tar.gz
rm -r freetype-gl-d5bc473468422f2cc536bab6e6a87a9aabb7ea07
