#!/bin/bash

# install brew first
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install cask
brew tap caskroom/cask

# install gpg
brew install gpg
# utils
brew install binutils
brew install cmake
brew install wget --with-iri
brew install tree
# After GPG is installed (or if it is already installed), install the security key for RVM:
# Ruby related
# check http://www.ruby-lang.org/en/downloads/ to get the recommended version
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
rvm install ruby-2.4.1
# brew install rbenv ruby-build rbenv-default-gems rbenv-gemset
brew install libyaml
gem update
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
brew cask install alfred bettertouchtool firefox google-chrome iterm2 keyremap4macbook skype sublime-text textexpander  dropbox 1password  divvy bartender disk-inventory-x flux beyond-compare sogouinput macvima dash wallpaper-wizard intellij-idea-ce eclipse-jee
brew cask install visual-studio-code
brew cask install macdown
brew cask install keepassxc

# vagrant and virtual box
# https://gist.github.com/tbonesteaks/000dc2d0584f30013913
brew cask install virtualbox
brew install Caskroom/cask/virtualbox-extension-pack
brew install Caskroom/cask/vagrant
brew install Caskroom/cask/vagrant-manager


# install jekyll
gem install jekyll bundler
gem install jekyll-paginate
gem install jekyll-gist

# install java
brew cask install java



