#!/bin/bash
# script to install some common utils

# install http-prompt(http://docs.http-prompt.com/en/latest/user-guide.html#installation)
pip3 install http-prompt
# help for clis
pip3 install cheat
# better top
pip3 install glances

# install kapitan
pip3 install --user --upgrade kapitan
sudo ln -s ~/.local/bin/kapitan /usr/local/bin/kapitan

sudo npm install -g diff-so-fancy
