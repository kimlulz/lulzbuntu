# lulzbuntu
Just script for configure my ubuntu desktop environment.  
To execute, `source [script].sh`

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

Install neofetch, nodejs, build-essential, curl, gdebi, gnome-tweaks, make, git    

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
```
            .-/+oossssoo+/-.               kimlulz@lulzbot 
        `:+ssssssssssssssssss+:`           --------------- 
      -+ssssssssssssssssssyyssss+-         OS: Ubuntu 20.04.2 LTS x86_64 
    .ossssssssssssssssssdMMMNysssso.       Host: 900X3K P12AEN 
   /ssssssssssshdmmNNmmyNMMMMhssssss/      Kernel: 5.8.0-50-generic 
  +ssssssssshmydMMMMMMMNddddyssssssss+     Uptime: 6 hours, 49 mins 
 /sssssssshNMMMyhhyyyyhmNMMMNhssssssss/    Packages: 2075 (dpkg), 11 (snap) 
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Shell: bash 5.0.17 
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   Resolution: 1920x1080 
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   DE: GNOME 
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   WM: Mutter 
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   WM Theme: Adwaita 
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Theme: WhiteSur-dark [GTK2/3] 
 /sssssssshNMMMyhhyyyyhdNMMMNhssssssss/    Icons: WhiteSur-dark [GTK2/3] 
  +sssssssssdmydMMMMMMMMddddyssssssss+     Terminal: gnome-terminal 
   /ssssssssssshdmNNNNmyNMMMMhssssss/      CPU: Intel i7-5500U (4) @ 3.000GHz 
    .ossssssssssssssssssdMMMNysssso.       GPU: Intel HD Graphics 5500 
      -+sssssssssssssssssyyyssss+-         Memory: 3367MiB / 7856MiB 
        `:+ssssssssssssssssss+:`
            .-/+oossssoo+/-.                                       
                                                                   


[APT] 0 updates available
[APT] 0 security updates available
```

[**username**|0] <U>*~/bin*</U> $ 

## lts_to_major.sh
Change LTS to Non-LTS.

## gnome_appearance.sh
Install gnome-tweaks, Dash to dock, whitesur
Should install some extentions manually

## PsCC-Linux.sh
Install Photoshop CC for Linux
Photoshop CC v19 installer for Linux  By  Gictorbit
https://github.com/Gictorbit/photoshopCClinux

script include install wine, winetrick

## ibus_KRKEY_Fix.sh
Fix 한영(KR/EN) Key function for iBus
set default kr106 to kr104
