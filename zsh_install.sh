#!/bin/bash
echo "WIP !DO NOT USE!"
echo ""
echo ""
sudo apt install -y zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
sudo apt install -y fonts-powerline
zsh
#chsh -s /usr/bin/zsh