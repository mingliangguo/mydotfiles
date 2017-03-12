#!/bin/bash

# setup vim and macvim
brew rm vim vim python macvim
brew install python
brew install vim --with-override-system-vi
brew install macvim --with-override-system-vim
sudo brew linkapps macvim

brew cask install alfred bettertouchtool firefox geektool google-chrome instacast iterm2 keyremap4macbook nv-alt skype rdio steam sublime-text textexpander 
brew cask install limechat
brew cask install macdown
brew cask install keepassxc
