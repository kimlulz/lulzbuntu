#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)

sudo apt install -y git wget zsh

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

echo "${bold}Do u want to install lolcat, fortune, cowsay?? [y, n]${normal}"
read aws
if [ $aws = "y" ]; then
    sudo apt install npm
    sudo apt install lolcat fortune
    sudo npm install cowsay
    wget -P ~/ https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/pepe2.ascii 
    cat ~/.zshrc > ~/.zshrc.bak
    echo "PS1='\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]|\[\e[0;1m\]$?\[\e[0m\]] \[\e[0;1;3;4m\]\w\[\e[0m\] \[\e[0;92m\]\$ \[\e[0m\]'
fortune | cowsay -f tux | lolcat 
neofetch --ascii ~/pepe2.ascii | lolcat" > ~/.zshrc
    cat ~/.zshrc.bak >> ~/.zshrc
else
    wget -P ~/ https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/pepe2.ascii
    cat ~/.zshrc > ~/.zshrc.bak
    echo "PS1='\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]|\[\e[0;1m\]$?\[\e[0m\]] \[\e[0;1;3;4m\]\w\[\e[0m\] \[\e[0;92m\]\$ \[\e[0m\]'
neofetch --ascii ~/pepe2.ascii" > ~/.zshrc
    cat ~/.zshrc.bak >> ~/.zshrc
fi

echo "Finished"
echo "Please Change Font Manually --> MesloLGS NF"
zsh
