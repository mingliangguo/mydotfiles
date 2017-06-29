#!/usr/bin/env bash

sudo apt-get install wget
wget https://github.com/gsamokovarov/jump/releases/download/v0.13.0/jump_0.13.0_amd64.deb
sudo dpkg -i jump_0.13.0_amd64.deb
