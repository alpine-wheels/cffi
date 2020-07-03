#!/bin/sh

set -e

# install os dependencies
apk add --no-cache gcc libffi-dev mercurial musl-dev

# find version
CFFI_VERSION="$(awk -F '==' '/cffi/ { print $2 }' requirements.txt)"

# check out source code
rm -rf cffi
hg clone --update "v${CFFI_VERSION}" https://foss.heptapod.net/pypy/cffi

# build
cd cffi || exit
python setup.py bdist_wheel
