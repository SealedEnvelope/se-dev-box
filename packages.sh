#!/usr/bin/env bash

install_or_check_for_upgrade() {
  if [ -d "/usr/local/Cellar/$(basename $1)" ]; then
    ask_to_update $1
  else
    brew install $1
  fi
}

ask_to_update() {
  if $(brew outdated | egrep --quiet "^$1"); then
    read -p "Upgrade $1? [y|N] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo
      brew upgrade $1
    fi
  elif [[ -n $DEBUG ]]; then
    echo "$1 is up-to-date"
  fi
}

if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi

brew update

install_or_check_for_upgrade coreutils
install_or_check_for_upgrade findutils
install_or_check_for_upgrade bash
install_or_check_for_upgrade bash-completion
install_or_check_for_upgrade bash-git-prompt
install_or_check_for_upgrade gawk
install_or_check_for_upgrade gnu-sed
brew tap homebrew/dupes 2>/dev/null
install_or_check_for_upgrade homebrew/dupes/grep

install_or_check_for_upgrade chruby
install_or_check_for_upgrade emacs --cocoa --with-gnutls
install_or_check_for_upgrade git
install_or_check_for_upgrade mackup
install_or_check_for_upgrade mysql
install_or_check_for_upgrade node
install_or_check_for_upgrade pandoc
install_or_check_for_upgrade ruby-install
install_or_check_for_upgrade tmux
install_or_check_for_upgrade wine
# install_or_check_for_upgrade --HEAD phantomjs

apps=(
  basictex
  bittorrent-sync
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
  onepassword
  r
  simple-comic
  skim
  telephone
  utorrent
  vagrant
  virtualbox
  vlc
  xquartz
)
brew tap caskroom/versions 2>/dev/null
for app in ${apps[@]}; do
  if [[ -z $(brew cask list | grep "${app}") ]]; then
    [[ -d /opt/homebrew-cask/Caskroom/"${app}" ]] && brew uninstall "${app}"
    brew cask install --force "${app}"
  fi
done

brew cleanup
