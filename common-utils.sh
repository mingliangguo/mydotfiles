#!/usr/bin/env bash

echo "install oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

# install the theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install the interactive cd plugin
git clone https://github.com/changyuheng/zsh-interactive-cd.git ~/.zsh/zsh-interactive-cd/
# install gradle plugin
git clone git://github.com/eriwen/gradle-completion ~/.zsh/gradle-completion

# install powerline fonts
git clone https://github.com/powerline/fonts.git ~/.fonts
. ~/.fonts/install.sh

# install powerline
pip install powerline-status

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# install tmux-powerline
mkdir ~/.tmux
git clone https://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline

# install zsh-interactive-shell
git clone git@github.com:changyuheng/zsh-interactive-cd.git ~/.zsh


