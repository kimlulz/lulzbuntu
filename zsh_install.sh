#!/bin/bash
echo "WIP !DO NOT USE!"
echo ""
echo ""
sudo apt install -y zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh --unattended
sudo apt install -y fonts-powerline
#!/bin/zsh
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
#chsh -s /usr/bin/zsh