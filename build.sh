#!/bin/bash
# use a makefile?

rm -r docs/*
cp -r src/* docs

function build() {
  hyperlisp "$1" "$(echo "$1" | sed "s/\\.lisp$/.html/")"
  rm "$1"
}
export -f build

find docs -type f -name "*.lisp" -exec bash -c 'build {}' \;
