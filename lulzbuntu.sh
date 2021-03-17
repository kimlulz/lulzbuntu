#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
echo "################################################################################"
echo "################################ Upgrade Script ################################"
echo "################################################################################"
echo "${bold}!!! Plz using with SUDO PERMISSION!!!"
echo "S C R I P T   B Y   K I M L U L Z${normal}"

echo "### Change APT SERVER"
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

echo "### update apt list"
sudo apt update
echo "### upgrade all apt"
sudo apt upgrade -y
echo "### upgrade distro"
sudo apt dist-upgrade

echo "### Install basic Package"
sudo add-apt-repository ppa:dawidd0811/neofetch -y
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install -y neofetch build-essential curl gdebi gnome-tweaks make git 
echo "### Install whale"
wget https://installer-whale.pstatic.net/downloads/installers/naver-whale-stable_amd64.deb --no-check-certificate
sudo dpkg -i naver-whale-stable_amd64.deb
echo "### Install vscode"
wget https://az764295.vo.msecnd.net/stable/f30a9b73e8ffc278e71575118b6bf568f04587c8/code_1.54.1-1614898113_amd64.deb --no-check-certificate
sudo dpkg -i code_1.54.1-1614898113_amd64.deb
echo "### Install VMware Player"
wget https://download3.vmware.com/software/player/file/VMware-Player-16.1.0-17198959.x86_64.bundle --no-check-certificate
sudo sh VMware-Player-16.1.0-17198959.x86_64.bundle
echo "### Install balenaEtcher"
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt install balena-etcher-electron 

echo "### Remove unused apps"
sudo apt purge firefox thunderbird google-chrome-stable -y
echo "### Remove unused apt"
sudo apt autoremove -y
echo "### Remove downloaded files"
sudo rm code_1.54.1-1614898113_amd64.deb
sudo rm VMware-Player-16.1.0-17198959.x86_64.bundle
sudo rm naver-whale-stable_amd64.deb

echo "### Add neofetch in your shell"
echo 'neofetch' >> /home/$USERNAME/.bashrc
echo "${bold}***Finished!!"
