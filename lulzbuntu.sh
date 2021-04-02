#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
echo "################################################################################"
echo "################################ Upgrade Script ################################"
echo "################################################################################"
echo "${bold}!!! Required sudo permission !!!"
echo "S C R I P T   B Y   K I M L U L Z"
echo "github.com/kimlulz/lulzbuntu${normal}"

echo "### Change Mirror Server"
echo "mirror.kakao.com"
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

echo "### Update apt list"
sudo apt update
echo "### Upgrade all apt"
sudo apt upgrade -y
echo "### Upgrade distro"
sudo apt dist-upgrade

echo "### Install basic package"
sudo add-apt-repository ppa:dawidd0811/neofetch -y
sudo add-apt-repository ppa:git-core/ppa -y
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt update
sudo apt install -y neofetch nodejs build-essential curl gdebi gnome-tweaks make git apt-transport-https
echo "### Install Whale Browser (Based on Chromium)"
sudo sh -c 'echo "deb [arch=amd64] http://repo.whale.naver.com/stable/deb stable main" >> /etc/apt/sources.list.d/naver-whale.list'
wget -q -O - http://repo.whale.naver.com/stable/deb/public.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install naver-whale-stable
echo "### Install VSCode"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install code 
echo "### Install VMware Player"
wget https://download3.vmware.com/software/player/file/VMware-Player-16.1.0-17198959.x86_64.bundle --no-check-certificate
sudo sh VMware-Player-16.1.0-17198959.x86_64.bundle
echo "### Install balenaEtcher"
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt-get update
sudo apt install balena-etcher-electron -y
echo "### Install Spotify"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt install spotify-client

echo "### Remove unused packages"
sudo apt purge firefox* thunderbird* google-chrome-stable -y
sudo apt autoremove -y
echo "### Remove downloaded files"
sudo rm VMware-Player-16.1.0-17198959.x86_64.bundle

echo "### Add neofetch in your shell"
echo 'neofetch' >> /home/$USERNAME/.bashrc
echo "${bold}***Finished!!"
