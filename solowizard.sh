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

# need to merge w/ pivotal changes
if [[ -d pivotal_workstation ]]; then
  # cd pivotal_workstation && git pull && cd ..
  cd pivotal_workstation && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
  cd pivotal_workstation
  git checkout fcf33b4d5b5f0715cd7945e200819ab095112be0
  cd ..
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
