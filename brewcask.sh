#!/bin/bash

# install brew first
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install gpg
brew install gpg
# After GPG is installed (or if it is already installed), install the security key for RVM:
# Ruby related
# check http://www.ruby-lang.org/en/downloads/ to get the recommended version
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
rvm install ruby-2.4.1
brew install libyaml
gem update
# setup vim and macvim
brew rm vim vim python macvim
brew install python
brew install vim --with-override-system-vi
brew install macvim --with-override-system-vim
sudo brew linkapps macvim

# for [jump](https://github.com/gsamokovarov/jump)
brew install jump 
brew install jq 
brew install jid 
brew install http-prompt 
brew install httpie

brew cask install alfred bettertouchtool firefox geektool google-chrome instacast iterm2 keyremap4macbook nv-alt skype rdio steam sublime-text textexpander 
brew cask install limechat
brew cask install macdown
brew cask install keepassxc

# install jekyll
gem install jekyll bundler
gem install jekyll-paginate
gem install jekyll-gist


