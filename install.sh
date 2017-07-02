#!/usr/bin/env bash
xcode-select —install
sudo xcodebuild -license
#
echo "install oh-my-zsh"
# wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s `which zsh`

# install the theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install the interactive cd plugin
git clone https://github.com/changyuheng/zsh-interactive-cd.git ~/.zsh/zsh-interactive-cd/
# install gradle plugin
git clone git://github.com/eriwen/gradle-completion ~/.zsh/gradle-completion

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# install powerline fonts
git clone https://github.com/powerline/fonts.git ~/.fonts
. ~/.fonts/install.sh

# install powerline
pip install powerline-status

# install tmux-powerline
mkdir ~/.tmux
git clone https://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline

# install zsh-interactive-shell
git clone git@github.com:changyuheng/zsh-interactive-cd.git ~/.zsh

# copy dot files
echo "--- begin to copy dot files"
cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
