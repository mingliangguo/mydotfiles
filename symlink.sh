#!/usr/bin/env bash

rm ~/.vimrc
rm ~/.gvimrc
rm ~/.zshrc
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.myprofile
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.tmux.conf
rm ~/.eslintrc
rm ~/.aliases
mv ~/.zpreztorc ~/.zpreztorc.original
mv ~/.zshrc ~/.zshrc.original

cwd=${PWD} 
ln -fs $cwd/.vimrc ~/.vimrc
ln -fs $cwd/.gvimrc ~/.gvimrc
ln -fs $cwd/zprezto/.zpreztorc ~/.zpreztorc
ln -fs $cwd/zprezto/.zshrc.zprezto ~/.zshrc
ln -fs $cwd/.bashrc ~/.bashrc
ln -fs $cwd/.bash_profile ~/.bash_profile
ln -fs $cwd/.myprofile ~/.myprofile
ln -fs $cwd/.gitconfig ~/.gitconfig
ln -fs $cwd/.gitignore ~/.gitignore
ln -fs $cwd/.tmux.conf ~/.tmux.conf
ln -fs $cwd/.eslintrc ~/.eslintrc
ln -fs $cwd/.aliases ~/.aliases
