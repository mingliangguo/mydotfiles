#!/usr/bin/env bash

[[ -s ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc.original
[[ -s ~/.bashrc ]] && mv ~/.bashrc  ~/.bashrc.original
[[ -s ~/.bash_profile ]] && mv ~/.bash_profile  ~/.bash_profile.original
[[ -s ~/.myprofile ]] && rm ~/.myprofile
[[ -s ~/.gitconfig ]] && mv ~/.gitconfig  ~/.gitconfig.original
[[ -s ~/.gitignore ]] && mv ~/.gitignore ~/.gitignore.original
[[ -s ~/.eslintrc ]] && mv ~/.eslintrc  ~/.eslintrc.original
[[ -s ~/.aliases ]] && mv ~/.aliases ~/.aliases.original
[[ -s ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.original

cwd=${PWD}
ln -fs $cwd/../.vimrc ~/.vimrc
ln -fs $cwd/../.bashrc ~/.bashrc
ln -fs $cwd/../.bash_profile ~/.bash_profile
ln -fs $cwd/../.gitconfig ~/.gitconfig
ln -fs $cwd/../.gitignore ~/.gitignore
ln -fs $cwd/../.eslintrc ~/.eslintrc
ln -fs $cwd/../.aliases ~/.aliases
ln -fs $cwd/.myprofile ~/.myprofile
ln -fs $cwd/.zshrc ~/.zshrc
