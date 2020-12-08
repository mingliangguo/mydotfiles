#!/bin/bash

# install brew first
#echo "install brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install cask
#brew tap caskroom/cask

# install gpg
brew install gpg
brew install libyaml
brew install htop
# easier file navigation: https://github.com/ranger/ranger
brew install ranger
brew install fd
brew install kubectx
brew install kube-ps1
brew install denisidoro/tools/navi

brew tap muesli/tap && brew install duf

# utils
brew install binutils
brew install cmake
brew install wget --with-iri
brew install tree
brew install m-cli
#
# neovim
brew install neovim/neovim/neovim

# for [jump](https://github.com/gsamokovarov/jump)
brew install autojump
brew install tmux
brew install reattach-to-user-namespace
brew install fzf

# Install python
brew install pyenv-virtualenv

# facebook path picker
brew install fpp

# install node
brew install node

# CLI utility for better json display and manipulation
brew install jq
brew install jid

# better curl replacement
brew install http-prompt
brew install httpie
# For better git diff display
brew install icdiff diff-so-fancy hub
# For quick code search => https://github.com/ggreer/the_silver_searcher
brew install rg tldr cheat ansible prettier

# softwares

# install java
# brew cask install java

brew cask install alfred bettertouchtool iterm2 textexpander divvy bartender disk-inventory-x flux beyond-compare dash  flycut hyper
brew cask install neteasemusic
# rime input
brew cask install squirrel
# install IDEs
brew cask install intellij-idea-ce eclipse-jee  sublime-text visual-studio-code
# install browsers
brew cask install firefox google-chrome homebrew/cask-versions/google-chrome-canary  vivaldi chromium opera brave-browser
# brew cask install vnc-viewer
brew cask install macdown
brew cask install keepassxc
brew cask install gas-mask
brew cask install itsycal
brew cask install shortcat

# vagrant and virtual box
# https://gist.github.com/tbonesteaks/000dc2d0584f30013913
brew cask install virtualbox
brew install Caskroom/cask/virtualbox-extension-pack
brew install Caskroom/cask/vagrant
brew install Caskroom/cask/vagrant-manager

# install fira code
brew tap homebrew/cask-fonts
brew cask install font-fira-code

brew cask install istat-menus
brew cask install daisydisk
brew cask install http-toolkit

## install redis-cli
brew tap ringohub/redis-cli
brew install redis-cli
brew install stern

## Install openjdk-j9, refer to: https://github.com/AdoptOpenJDK/homebrew-openjdk
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk11-openj9
brew cask install adoptopenjdk14-openj9
