#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
echo "################################################################################"
echo "################################ Upgrade Script ################################"
echo "################################################################################"
echo "${bold}!!! Plz using with SUDO PERMISSION!!!"
echo "S C R I P T   B Y   K I M L U L Z${normal}"
echo ""

echo "***Change APT SERVER"
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
echo ""

echo "***update apt list"
sudo apt update
echo ""

echo "***upgrade all apt"
sudo apt upgrade -y
echo ""

echo "***upgrade distro"
sudo apt dist-upgrade
echo ""

echo ""
echo "***install basic Package"
sudo add-apt-repository ppa:dawidd0811/neofetch
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y neofetch build-essential curl gdebi gnome-tweaks make git 
echo "***install whale"
wget https://installer-whale.pstatic.net/downloads/installers/naver-whale-stable_amd64.deb --no-check-certificate
sudo dpkg -i naver-whale-stable_amd64.deb
echo ""

echo "***install vscode"
wget https://az764295.vo.msecnd.net/stable/f30a9b73e8ffc278e71575118b6bf568f04587c8/code_1.54.1-1614898113_amd64.deb --no-check-certificate
sudo dpkg -i code_1.54.1-1614898113_amd64.deb
echo ""

echo "***install VMware Player"
wget https://download3.vmware.com/software/player/file/VMware-Player-16.1.0-17198959.x86_64.bundle --no-check-certificate
sudo sh VMware-Player-16.1.0-17198959.x86_64.bundle
echo ""

echo "Remove unused apps"
sudo apt purge firefox thunderbird

echo "***remove unused apt"
sudo apt autoremove -y
echo ""

echo "please copy&paste the command below"
echo ""
echo "echo 'neofetch' >> /$HOME/.bashrc"
echo ""
echo "${bold}***Finished!!"
