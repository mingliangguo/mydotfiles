#!/bin/bash

set -e

if [[ -f ~/.vimrc ]]
then
  echo "You already have a ~/.vimrc. Aborting to avoid losing data..."
  exit 1
fi

SAVE_AS="echo "
if [ -x "$(command -v wget)" ]; then
    echo "wget found!!"
    SAVE_AS="wget -O "
elif [ -x "$(command -v curl)" ]; then
    echo "curl found!!"
    SAVE_AS="curl -LSso "
else
    echo "!!! Neither wget nor curl exists in the system, having to exit!!!"
    exit 1
fi

echo "installing pathogen"
mkdir -p ~/.vim/bundle ~/.vim/autoload
$SAVE_AS ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "installing color themes..."
mkdir -p ~/.vim/colors
$SAVE_AS ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

echo "installing sensible.vim..."
mkdir -p ~/.vim/bundle/plugin
cd ~/.vim/bundle/plugin
$SAVE_AS ~/.vim/bundle/plugin/sensible.vim  https://raw.githubusercontent.com/tpope/vim-sensible/master/plugin/sensible.vim

echo "installing nerdtree.vim"
mkdir -p ~/temp/nerdtree
cd ~/temp/nerdtree
$SAVE_AS 5.0.0.zip https://github.com/scrooloose/nerdtree/archive/5.0.0.zip
unzip 5.0.0.zip
mv nerdtree-5.0.0 nerdtree
mv nerdtree ~/.vim/bundle/
cd ~
rm -rf ~/temp/nerdtree

echo "installing ctrlp.vim"
mkdir -p ~/temp/ctrlp
cd ~/temp/ctrlp
$SAVE_AS 1.80.zip https://github.com/ctrlpvim/ctrlp.vim/archive/1.80.zip
unzip 1.80.zip
mv  ctrlp.vim-1.80 ctrlp
mv ctrlp ~/.vim/bundle/
cd ~
rm -rf ~/temp/ctrlp

echo "installing ack.vim"
mkdir -p ~/temp/ack
cd ~/temp/ack
$SAVE_AS 1.0.9.zip https://github.com/mileszs/ack.vim/archive/1.0.9.zip
unzip 1.0.9.zip
mv  ack.vim-1.0.9 ack.vim
mv ack.vim ~/.vim/bundle/
cd ~
rm -rf ~/temp/ack.vim

echo "Adding contents to ~/.vimrc"
echo "set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on
\" color delek
color molokai
set vb
let mapleader = \",\"
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hlsearch
set paste
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let NERDTreeDirArrows=0
:nnoremap <leader>n :NERDTreeToggle<cr>
:nnoremap <leader>r :NERDTreeFind<cr>
\" easier window movement
:nnoremap <C-H> <C-W>h
:nnoremap <C-J> <C-W>j
:nnoremap <C-K> <C-W>k
:nnoremap <C-L> <C-W>l
" > ~/.vimrc


echo "Done!"


