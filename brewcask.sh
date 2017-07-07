#!/bin/bash

# install brew first
echo "install brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install cask
brew tap caskroom/cask

# install gpg
brew install gpg
brew install libyaml

# utils
brew install binutils
brew install cmake
brew install wget --with-iri
brew install tree
# 
# setup vim and macvim
brew rm vim vim python macvim
brew install python
brew install vim --with-override-system-vi
brew install macvim --with-override-system-vim
sudo brew linkapps macvim

# neovim
brew install neovim/neovim/neovim

# for [jump](https://github.com/gsamokovarov/jump)
brew install jump 
brew install tmux
brew install reattach-to-user-namespace
brew install fzf

# install node
brew install node

# CLI utility for better json display and manipulation
brew install jq 
brew install jid 

# better curl replacement
brew install http-prompt 
brew install httpie
# For better git diff display
brew install icdiff
# For quick code search => https://github.com/ggreer/the_silver_searcher
brew install the_silver_searcher

# softwares
# To complete the installation of Cask sogouinput, you must also run the installer at '/usr/local/Caskroom/sogouinput/3.7.0.1459/安装搜狗输入法.app'
brew cask install alfred bettertouchtool firefox google-chrome iterm2 keyremap4macbook skype sublime-text textexpander  dropbox 1password  divvy bartender disk-inventory-x flux beyond-compare sogouinput macvima dash wallpaper-wizard intellij-idea-ce eclipse-jee vivaldi
brew cask install vnc-viewer
brew cask install visual-studio-code
brew cask install macdown
brew cask install keepassxc
brew cask install gas-mask
brew cask install itsycal

# vagrant and virtual box
# https://gist.github.com/tbonesteaks/000dc2d0584f30013913
brew cask install virtualbox
brew install Caskroom/cask/virtualbox-extension-pack
brew install Caskroom/cask/vagrant
brew install Caskroom/cask/vagrant-manager


# install java
brew cask install java

