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

### Update APT Packages
`sudo apt update`  
`sudo apt upgrade -y`  
`sudo apt dist-upgrade`

### Install Basic Packages
`sudo add-apt-repository ppa:dawidd0811/neofetch`   
`sudo add-apt-repository ppa:git-core/ppa`   
`sudo apt update`   
`sudo apt install -y neofetch build-essential curl gdebi gnome-tweaks make git`   

### install whale_Browser
`wget https://installer-whale.pstatic.net/downloads/installers/naver-whale-stable_amd64.deb --no-check-certificate`   
`sudo dpkg -i naver-whale-stable_amd64.deb` 

### install vscode
`wget https://az764295.vo.msecnd.net/stable/f30a9b73e8ffc278e71575118b6bf568f04587c8/code_1.54.1-1614898113_amd64.deb --no-check-certificate`   
`sudo dpkg -i code_1.54.1-1614898113_amd64.deb` 

### install VMware Player
`wget https://download3.vmware.com/software/player/file/VMware-Player-16.1.0-17198959.x86_64.bundle --no-check-certificate`   
`sudo sh VMware-Player-16.1.0-17198959.x86_64.bundle` 

### install balenaEtcher
`echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list`   
`sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61`    
`sudo apt install balena-etcher-electron` 

### Remove unused Packages
`sudo apt purge firefox thunderbird google-chrome-stable`   
`sudo apt autoremove -y`

### Remove downloaded files
`sudo rm code_1.54.1-1614898113_amd64.deb`    
`sudo rm VMware-Player-16.1.0-17198959.x86_64.bundle`    
`sudo rm naver-whale-stable_amd64.deb`    

### Add Neofetch to .bashrc
`echo 'neofetch' >> /home/$USERNAME/.bashrc` 

## ibus_KRKEY_Fix.sh
Fix 한영(KR/EN) Key function for iBus
### Copy and Paste modified file
`default  alphanumeric_keys
xkb_symbols "kr104" {
    include "us"
    name[Group1]= "Korean (101/104 key compatible)";
    include "kr(ralt_hangul)"
    include "kr(rctrl_hanja)"
};`     
`cp kr /usr/share/X11/xkb/symbols/kr`
