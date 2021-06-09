#!/bin/bash
sudo apt install -y git wget zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo apt install -y fonts-powerline
chsh -s /usr/bin/zsh
#!/bin/zsh
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
echo "Finished"
zsh