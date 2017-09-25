#!/usr/bin/env bash

sudo apt-get install wget
wget https://github.com/gsamokovarov/jump/releases/download/v0.13.0/jump_0.13.0_amd64.deb
sudo dpkg -i jump_0.13.0_amd64.deb

# install latest nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install neovim

