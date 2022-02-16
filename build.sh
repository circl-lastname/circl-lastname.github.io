#!/bin/bash
# use a makefile?

rm -r docs/*
cp -r src/* docs

function build() {
  hyperlisp "$1" "$(echo "$1" | sed "s/\\.hl$/.html/")"
  rm "$1"
}
export -f build

find docs -type f -name "*.hl" -exec bash -c 'build {}' \;
