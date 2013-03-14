#!/bin/bash

pushd `pwd`

mkdir -p ~/cookbooks; cd ~/cookbooks
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::bash4
- pivotal_workstation::bash_completion
- pivotal_workstation::bash_it
- pivotal_workstation::chrome
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::dropbox
- pivotal_workstation::evernote
- pivotal_workstation::finder_display_full_path
- pivotal_workstation::firefox
- pivotal_workstation::freeruler
- pivotal_workstation::function_keys
- pivotal_workstation::gem_setup
- pivotal_workstation::git
- pivotal_workstation::gitx
- pivotal_workstation::homebrew
- pivotal_workstation::increase_shared_memory
- pivotal_workstation::keyboard_preferences
- pivotal_workstation::locate_on
- pivotal_workstation::menubar_preferences
- pivotal_workstation::node_js
- pivotal_workstation::rvm
- pivotal_workstation::screen_sharing_app
- pivotal_workstation::set_finder_show_all_hd_on_desktop
- pivotal_workstation::skype
- pivotal_workstation::sshd_on
- pivotal_workstation::unix_essentials
- pivotal_workstation::user_owns_usr_local
- pivotal_workstation::vagrant
- pivotal_workstation::virtualbox
- pivotal_workstation::xquartz
- se-dev-box::autoconf
- se-dev-box::automake
- se-dev-box::bash_it-plugins
- se-dev-box::bash_it-bundler-exec
- se-dev-box::bash_it-fix_prompt
- se-dev-box::bash_it-home_bin_path
- se-dev-box::bash_it-locale_vars
- se-dev-box::bash_it-usr_local_sbin_path
- se-dev-box::bash_it-vagrant_helpers
- se-dev-box::bashrc-source_bashprofile
- se-dev-box::boxcryptor
- se-dev-box::coreutils
- se-dev-box::emacs
- se-dev-box::git_config_global_defaults
- se-dev-box::google-drive
- se-dev-box::google-voice
- se-dev-box::gpgtools
- se-dev-box::node_packages
- se-dev-box::phantomjs
- se-dev-box::r
node_attributes:
  git:
    user_name:
    user_email:
    user_signingkey:
  github:
    user:
    token:
EOF
popd
