# lulzbuntu
Shell script for configure my ubuntu desktop environment.  
To execute, `sudo sh [script].sh`

In case of error while using script (Ex. `oh no something has gone wrong`), reboot ->

recovery mode -> dpkg

or 

normal boot -> CTRL+ALT+F4 -> login -> `sudo dpkg --configure -a` -> `reboot` -> `./lulzbuntu.sh` 

## lulzbuntu.sh
### Change APT Server
`sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list`
### Update distro and APTs
### Install Packages
Add APT Repository ppa:dawidd0811/neofetch, ppa:git-core/ppa    

Use Curl https://deb.nodesource.com/setup_15.x to get node.js v.15 (Official repo has an old version of nodejs..)    

Install neofetch, nodejs, build-essential, libva-dev, vainfo, curl, gdebi, gnome-tweaks, make, git    

Install Whale Browser (Based on Chromium), VSCode, VMware Player, balenaEtcher, Spotify    

Remove firefox, thunderbird, google-chrome-stable and unused packages(apt autoremove)    

Remove downloaded files (VMware Player)    
  
### Customize .bashrc
```
PS1='\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]|\[\e[0;1m\]$?\[\e[0m\]] \[\e[0;1;3m\]\w \[\e[0;92m\]\$ \[\e[0m\]'
neofetch
IFS=';' read updates security_updates < <(/usr/lib/update-notifier/apt-check 2>&1)
echo "[APT]" $updates "updates available"
echo "[APT]" $security_updates "security updates available"
if [ -f /var/run/reboot-required ]; then
  echo '[APT] Reboot Required'
fi
```
![스크린샷, 2021-05-09 18-38-30](https://user-images.githubusercontent.com/42508318/117567176-dc093880-b0f5-11eb-9ae0-03b78629f7ad.png)


## lts_to_major.sh
Change LTS to Non-LTS.

## gnome_appearance.sh
Install gnome-tweaks, Dash to dock, whitesur
Should install some extentions manually..

## PsCC-Linux.sh
Install Photoshop CC for Linux
Photoshop CC v19 installer for Linux  By  Gictorbit
https://github.com/Gictorbit/photoshopCClinux

script include install wine, winetrick

## ibus_KRKEY_Fix.sh
Fix 한영(KR/EN) Key function for iBus
set default kr106 to kr104
