#!/usr/bin/env bash
# based on https://github.com/MatthewMueller/dots
set -e # exit on errors

source ./settings.sh
source ./packages.sh
./texpackages.rb
source ./se.sh
