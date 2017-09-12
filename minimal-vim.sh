#!/bin/bash

set -e

if [[ -f ~/.vimrc ]]
then
  echo "You already have a ~/.vimrc. Aborting to avoid losing data..."
  exit 1
fi

echo "installing pathogen"
mkdir -p ~/.vim/bundle ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "installing sensible.vim..."
mkdir -p ~/.vim/bundle/plugin
cd ~/.vim/bundle/plugin
curl -LSso ~/.vim/bundle/plugin/sensible.vim https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

echo "installing nerdtree.vim"
mkdir -p ~/temp/nerdtree
cd ~/temp/nerdtree
wget https://github.com/scrooloose/nerdtree/archive/5.0.0.zip
unzip 5.0.0.zip
mv nerdtree-5.0.0 nerdtree
mv nerdtree ~/.vim/bundle/
rm -rf ~/temp/nerdtree

echo "Adding contents to ~/.vimrc"
echo "set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on
color delek
set vb
let mapleader = \",\"
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
:nnoremap <leader>n :NERDTreeToggle<cr>
\" easier window movement
:nnoremap <C-H> <C-W>h
:nnoremap <C-J> <C-W>j
:nnoremap <C-K> <C-W>k
:nnoremap <C-L> <C-W>l
\" compile swift projects
:nnoremap <leader>B :!clear && swift build<cr>
" > ~/.vimrc


echo "Done!"


