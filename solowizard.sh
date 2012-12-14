#!/bin/bash
# This shell script is based on one created at solowizard.com
# http://github.com/tommyh/solo_wizard
# (c) 2012, Tom Hallett
# This script may be freely distributed under the MIT license.

pushd `pwd`
if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/cookbooks; cd ~/cookbooks

if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
if [[ -d se-dev-box ]]; then
  cd se-dev-box && git pull && cd ..
else
  git clone https://github.com/SealedEnvelope/se-dev-box.git
fi

[ -f soloistrc ] && soloist
popd
