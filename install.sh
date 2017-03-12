#!/usr/bin/env bash

# install powerline fonts
git clone git@github.com:powerline/fonts.git ~/.fonts
. ~/.fonts/install.sh

# install powerline
pip install powerline-status

# install tmux-powerline
mkdir ~/.tmux
git clone https://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline

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
