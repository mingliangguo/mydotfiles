#!/bin/bash
# script to install nvim
# https://github.com/neovim/neovim/wiki/Installing-Neovim

pip3 install --user pynvim

mkdir -p ~/.config/nvim/backup
mkdir -p ~/.config/nvim/swap
mkdir -p ~/.config/nvim/undo

ln -s "$(pwd)/nvim/init.vim" ~/.config/nvim/init.vim


