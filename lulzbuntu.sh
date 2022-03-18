#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
echo "##############################################################################"
echo "################################ lulzbuntu.sh ################################"
echo "##############################################################################"
echo "${bold}S C R I P T   B Y   K I M L U L Z"
echo "github.com/kimlulz/lulzbuntu${normal}"

echo $USERNAME"|lulzbuntu.sh # [Process 1/6] Change Mirror Server"
echo "---> mirror.kakao.com"
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
echo ""

echo $USERNAME"|lulzbuntu.sh # [Process 2/6] Upgrade all Packages"
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade
echo ""

echo $USERNAME"|lulzbuntu.sh # [Process 3/6] Install Basic Packages"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install -y build-essential gnome-tweaks make git apt-transport-https htop wget curl
echo ""

echo $USERNAME"|lulzbuntu.sh # [Process 4/6] Install apps from external method"
echo "$ Install neofetch from Github"
git clone https://github.com/dylanaraps/neofetch
cd neofetch
sudo make install
cd ..
echo "$ Install Whale Browser(Naver) fro Naver Repo"
sudo sh -c 'echo "deb [arch=amd64] http://repo.whale.naver.com/stable/deb stable main" >> /etc/apt/sources.list.d/naver-whale.list'
wget -q -O - http://repo.whale.naver.com/stable/deb/public.gpg | sudo apt-key add -
sudo apt update
sudo apt install -y naver-whale-stable
echo "$ Install VSCode from MS Repo"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install -y code 

echo $USERNAME"|lulzbuntu.sh # [Process 5/6] Clean"
sudo apt purge firefox* thunderbird* -y
sudo apt autoremove -y
sudo rm -rf neofetch/
echo ""

echo $USERNAME"|lulzbuntu.sh # [Process 6/6] Customize bash shell"
echo ""
echo "${bold}Do u want to install lolcat, fortune, cowsay?? [y, n]${normal}"
read aws
if [ $aws = "y" ]; then
    sudo apt install lolcat fortune cowsay
    wget -P ~/ https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/pepe2.ascii 
    echo "PS1='\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]|\[\e[0;1m\]$?\[\e[0m\]] \[\e[0;1;3;4m\]\w\[\e[0m\] \[\e[0;92m\]\$ \[\e[0m\]'
fortune | cowsay -f tux | lolcat 
neofetch --ascii ~/pepe2.ascii | lolcat" > ~/.bashrc
else
    wget -P ~/ https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/pepe2.ascii 
    echo "PS1='\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]|\[\e[0;1m\]$?\[\e[0m\]] \[\e[0;1;3;4m\]\w\[\e[0m\] \[\e[0;92m\]\$ \[\e[0m\]'
neofetch --ascii ~/pepe2.ascii" > ~/.bashrc
fi

echo "${bold}****************************************************"
cat ~/.bashrc
echo "****************************************************${normal}"
sleep 5

echo $USERNAME"|lulzbuntu.sh # ${bold}Finished."
