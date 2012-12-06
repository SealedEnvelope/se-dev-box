#!/bin/bash
# This shell script was created at solowizard.com
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
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::bash_path_order
- pivotal_workstation::bash_profile-aliases
- pivotal_workstation::bash_profile-arch_flags
- pivotal_workstation::bash_profile-better_history
- pivotal_workstation::bash_profile-ctrl-o
- pivotal_workstation::bash_profile-ctrl-s
- pivotal_workstation::bash_profile-git_completion
- pivotal_workstation::bash_profile-no_sudo_gem_install
- pivotal_workstation::bash_profile-ps1
- pivotal_workstation::chrome
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::dropbox
- pivotal_workstation::evernote
- pivotal_workstation::finder_display_full_path
- pivotal_workstation::firefox
- pivotal_workstation::freeruler
- pivotal_workstation::function_keys
- pivotal_workstation::gem_no_rdoc_no_ri
- pivotal_workstation::git
- pivotal_workstation::global_environment_variables
- pivotal_workstation::homebrew
- pivotal_workstation::increase_shared_memory
- pivotal_workstation::keyboard_preferences
- pivotal_workstation::locate_on
- pivotal_workstation::menubar_preferences
- pivotal_workstation::node_js
- pivotal_workstation::screen_sharing_app
- pivotal_workstation::set_finder_show_all_hd_on_desktop
- pivotal_workstation::sshd_on
- pivotal_workstation::unix_essentials
- pivotal_workstation::user_owns_usr_local
- pivotal_workstation::vagrant
- pivotal_workstation::virtualbox
- se-dev-box::bash_profile-bundler-exec
- se-dev-box::bash_profile-locale_vars
- se-dev-box::bashrc-source_bashprofile
- se-dev-box::coreutils
- se-dev-box::emacs
- se-dev-box::google-drive
- se-dev-box::git_config_global_defaults
- se-dev-box::node_packages
- se-dev-box::pandoc
- se-dev-box::boxcryptor
node_attributes:
  pandoc:
    version: 1.9.4.2
    checksum: b42338e36feb93b521a49abd4fd97090dbe833ae8c537feb2e4ba33a9a75be66
EOF
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
soloist
popd
