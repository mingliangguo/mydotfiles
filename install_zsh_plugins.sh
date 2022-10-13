#!/usr/bin/env bash
xcode-select —install
sudo xcodebuild -license
#

# install the interactive cd plugin
git clone https://github.com/changyuheng/zsh-interactive-cd.git ~/.zprezto/modules/zsh-interactive-cd/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zprezto/modules/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions  ~/.zprezto/modules/zsh-autosuggestions



