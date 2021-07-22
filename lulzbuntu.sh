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
echo $USERNAME"|lulzbuntu.sh # [Process 1/6] END of process"

echo $USERNAME"|lulzbuntu.sh # [Process 2/6] Upgrade all Packages"
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade
echo $USERNAME"|lulzbuntu.sh # [Process 2/6] END of process"

echo $USERNAME"|lulzbuntu.sh # [Process 3/6] Install Basic Packages"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install -y neofetch build-essential gnome-tweaks make git apt-transport-https htop wget curl
echo $USERNAME"|lulzbuntu.sh # [Process 3/6] END of process"

echo $USERNAME"|lulzbuntu.sh # [Process 4/6] Install apps from external method"
echo "$ Install Whale Browser (NAVER_Chromium)..."
sudo sh -c 'echo "deb [arch=amd64] http://repo.whale.naver.com/stable/deb stable main" >> /etc/apt/sources.list.d/naver-whale.list'
wget -q -O - http://repo.whale.naver.com/stable/deb/public.gpg | sudo apt-key add -
sudo apt update
sudo apt install -y naver-whale-stable
echo "$ Install VSCode..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install -y code 
echo "$ Install VMWare Player..."
wget https://download3.vmware.com/software/player/file/VMware-Player-16.1.2-17966106.x86_64.bundle --no-check-certificate
sudo sh VMware-Player-16.1.2-17966106.x86_64.bundle
echo "$ Install Spotify..."
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client
sudo apt update
sudo apt install -y spotify-client 
echo $USERNAME"|lulzbuntu.sh # [Process 4/6] END of process"

echo $USERNAME"|lulzbuntu.sh # [Process 5/6] Clean"
sudo apt purge firefox* thunderbird* -y
sudo apt autoremove -y
sudo rm VMware-Player-16.1.2-17966106.x86_64.bundle
echo $USERNAME"|lulzbuntu.sh # [Process 5/6] END of process"

echo $USERNAME"|lulzbuntu.sh # [Process 6/6] Customize bash shell"
echo "PS1='\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]|\[\e[0;1m\]$?\[\e[0m\]] \[\e[0;1;3;4m\]\w\[\e[0m\] \[\e[0;92m\]\$ \[\e[0m\]'
neofetch" > ~/.bashrc 
cat ~/.bashrc
echo $USERNAME"|lulzbuntu.sh # [Process 6/6] END of process"
echo $USERNAME"|lulzbuntu.sh # ${bold}Finished."
