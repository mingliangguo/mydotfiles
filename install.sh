#!/usr/bin/env bash
xcode-select —install
sudo xcodebuild -license
#
# echo "install oh-my-zsh"
# # wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# chsh -s `which zsh`

# # install the theme
# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install the interactive cd plugin
git clone https://github.com/changyuheng/zsh-interactive-cd.git ~/.zsh/zsh-interactive-cd/
# install gradle plugin
git clone git://github.com/eriwen/gradle-completion ~/.zsh/gradle-completion

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# enable auto-completion for docker
curl -fLo ~/.zprezto/modules/completion/external/src/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
curl -fLo ~/.zprezto/modules/completion/external/src/_docker-compose https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose
compinit

# install powerline fonts
# git clone https://github.com/powerline/fonts.git ~/.fonts
# . ~/.fonts/install.sh
#
# install powerline
pip install powerline-status

# install tmux-powerline
mkdir ~/.tmux
git clone https://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline
