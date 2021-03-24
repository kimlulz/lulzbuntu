#!/bin/bash
echo "################################################################################"
echo "################################ GNU/PSCC Linux_ ################################"
echo "################################################################################"
echo "Photoshop CC v19 installer for Linux  By  Gictorbit"
echo "https://github.com/Gictorbit/photoshopCClinux"
echo "S C R I P T   B Y   K I M L U L Z"
echo "github.com/kimlulz/lulzbuntu${normal}"
echo "### Install Wine"
sudo apt update
sudo dpkg --add-architecture i386 
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt install --install-recommends winehq-stable
echo "### Install Additional extras of Wine"
sudo apt install -y  winetricks
echo "### Download PsCC-Linux from Github"
git clone https://github.com/Gictorbit/photoshopCClinux.git
cd photoshopCClinux
chmod +x setup.sh
echo "### Start install"
./setup.sh
