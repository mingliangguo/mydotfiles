#!/usr/bin/env bash
[[ -s ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc.original
[[ -s ~/.gvimrc ]] && mv ~/.gvimrc ~/.gvimrc
[[ -s ~/.bashrc ]] && mv ~/.bashrc  ~/.bashrc.original
[[ -s ~/.bash_profile ]] && mv ~/.bash_profile  ~/.bash_profile.original
[[ -s ~/.myprofile ]] && mv ~/.myprofile ~/.myprofile.original
[[ -s ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf.original
[[ -s ~/.gitconfig ]] && mv ~/.gitconfig  ~/.gitconfig.original
[[ -s ~/.gitignore ]] && mv ~/.gitignore ~/.gitignore.original
[[ -s ~/.eslintrc ]] && mv ~/.eslintrc  ~/.eslintrc.original
[[ -s ~/.aliases ]] && mv ~/.aliases ~/.aliases.original
[[ -s ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.original

mkdir -p ~/.config/nvim/
mkdir -p ~/.config/alacritty/
mkdir -p ~/.config/wezterm/
mkdir -p ~/.config/kitty/

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
ln -fs $cwd/nvim/init.vim ~/.config/nvim/
ln -fs $cwd/alacritty.yaml ~/.config/alacritty/
ln -fs $cwd/kitty.yaml ~/.config/alacritty/
ln -fs $cwd/wezterm.lua ~/.config/wezterm/
