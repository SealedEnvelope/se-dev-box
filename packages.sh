#!/usr/bin/env bash

install_or_check_for_upgrade() {
  if [ -d "/usr/local/Cellar/$(basename $1)" ]; then
    ask_to_update "$@"
  else
    brew install "$@"
  fi
}

ask_to_update() {
  if $(brew outdated | egrep --quiet "^$1"); then
    read -p "Upgrade $1? [y|N] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo
      brew upgrade "$@"
    fi
  elif [[ -n $DEBUG ]]; then
    echo "$1 is up-to-date"
  fi
}

if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

install_or_check_for_upgrade aspell
install_or_check_for_upgrade bash
install_or_check_for_upgrade bash-completion
install_or_check_for_upgrade bash-git-prompt
install_or_check_for_upgrade chruby
install_or_check_for_upgrade coreutils
install_or_check_for_upgrade emacs --cocoa --with-gnutls
install_or_check_for_upgrade findutils
install_or_check_for_upgrade gawk
install_or_check_for_upgrade ghostscript
install_or_check_for_upgrade git
brew tap homebrew/dupes 2>/dev/null
install_or_check_for_upgrade homebrew/dupes/grep
install_or_check_for_upgrade gnu-sed
install_or_check_for_upgrade jq
install_or_check_for_upgrade mackup
install_or_check_for_upgrade mysql
install_or_check_for_upgrade pandoc
install_or_check_for_upgrade percona-toolkit
install_or_check_for_upgrade phantomjs
install_or_check_for_upgrade ruby-install
install_or_check_for_upgrade sox --with-lame
install_or_check_for_upgrade tmux
install_or_check_for_upgrade w3m
install_or_check_for_upgrade wget
install_or_check_for_upgrade wine

brew upgrade

apps=(
  basictex
  bbc-iplayer-downloads
  dropbox
  evernote
  firefox
  flash
  free-ruler
  google-chrome
  google-drive
  gpgtools
  grandperspective
  hipchat
  java
  minecraft
  1password
  r
  sauce-connect
  screenhero
  slack
  skim
  techstoreclub-simple-comic
  utorrent
  vagrant
  virtualbox
  vlc
  xquartz
)
brew tap caskroom/cask 2>/dev/null
brew tap caskroom/versions 2>/dev/null
for app in ${apps[@]}; do
  if [[ -z $(brew cask list | grep "${app}") ]]; then
    [[ -d /opt/homebrew-cask/Caskroom/"${app}" ]] && brew uninstall "${app}"
    brew cask install --force "${app}"
  fi
done

brew cleanup
brew cask cleanup

if [ ! -f "~/.bundler-exec.sh" ]; then
  curl --silent https://raw.githubusercontent.com/gma/bundler-exec/master/bundler-exec.sh > ~/.bundler-exec.sh
  if ! grep --quiet "bundler-exec.sh" ~/.bashrc ; then
    printf "\nsource ~/.bundler-exec.sh\n" >> ~/.bashrc
  fi
fi

npm_packages=(
  grunt-cli
  jshint
  uglifyjs
)
for pkg in ${npm_packages[@]}; do
  if ! npm list --global --silent $pkg >/dev/null ; then
    npm install --global --quiet $pkg
  fi
done
