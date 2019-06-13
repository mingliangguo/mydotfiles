#!/bin/bash
# script to install nvim
# https://github.com/neovim/neovim/wiki/Installing-Neovim

brew install nvim
pip3 install --user pynvim

mkdir -p ~/.config/nvim/backup
mkdir -p ~/.config/nvim/swap
mkdir -p ~/.config/nvim/undo

ln -s ~/.vim ~/.config/nvim
ln -s ./vimrc ~/.config/nvim/init.vim


