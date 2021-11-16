#!/bin/bash

if [ -f /etc/apt/sources.list ]; then
  sudo apt install -y git wget zsh
elif [ -f /etc/fedora-release ]; then
  sudo dnf install -y git wget zsh
else
  echo "QUIT"
  exit
fi

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s /usr/bin/zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
mkdir ~/.local/share/fonts
mv MesloLGS*.ttf ~/.local/share/fonts/
fc-cache -f -v
echo "## Install Plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git fast-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
wget https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/pepe2.ascii -P ~/
echo "neofetch --ascii ~/pepe2.ascii" >> ~/.zshrc
echo "Finished"
echo "Please Change Font Manually --> MesloLGS NF"
zsh
