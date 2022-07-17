#!/bin/bash

# install brew first
echo "install brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install
#brew tap room/cask

# install gpg
brew install gpg
brew install libyaml
brew install htop bat prettyping
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
brew install watch
brew install socat hexyl
#
# neovim
brew install neovim/neovim/neovim

# for [jump](https://github.com/gsamokovarov/jump)
brew install jump
brew install tmux byobu
brew install reattach-to-user-namespace
brew install fzf

# Install python
brew install pyenv pyenv-virtualenv

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

brew install --cask alfred bettertouchtool iterm2 textexpander divvy bartender disk-inventory-x flux beyond-compare dash flycut hyper terminus
# rime input
brew  install --cask squirrel
# install IDEs
brew install --cask intellij-idea-ce sublime-text visual-studio-code
# install browsers
brew install --cask firefox google-chrome vivaldi chromium opera brave-browser microsoft-edge brave-browser
# brew  install vnc-viewer
brew install --cask macdown
brew install --cask keepassxc
brew install --cask gas-mask
brew install --cask itsycal
brew install --cask shortcat
brew install --cask karabiner-elements
brew install balenaetcher

# vagrant and virtual box
# https://gist.github.com/tbonesteaks/000dc2d0584f30013913
brew install --cask virtualbox
brew install --cask room/cask/virtualbox-extension-pack
brew install --cask room/cask/vagrant
brew install --cask room/cask/vagrant-manager

# install fira code
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

brew install --cask istat-menus
brew install --cask daisydisk
brew install http-toolkit

## install redis-cli
# brew tap ringohub/redis-cli
# brew install redis-cli
brew install stern
brew install mkdocs
pip install mkdocs-material

## Install openjdk-j9, refer to: https://github.com/AdoptOpenJDK/homebrew-openjdk

brew tap AdoptOpenJDK/openjdk
brew install --cask adoptopenjdk/openjdk/adoptopenjdk8
brew install --cask adoptopenjdk11-openj9
