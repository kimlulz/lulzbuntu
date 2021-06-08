#!/bin/bash
echo "WIP !DO NOT USE!"
echo ""
echo ""
sudo apt install -y zsh
git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp -f .zshrc ~/
sudo apt install fonts-powerline
zsh
#chsh -s /usr/bin/zsh