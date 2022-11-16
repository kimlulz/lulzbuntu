# lulzbuntu
Shell script for configure my ubuntu desktop environment.

## lulzbuntu.sh
### Change APT Server
`sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list`    
### Update distro and APTs
### Install Packages
#### **From Official Repo**
```
gnome-tweaks make cmake wget curl htop pkg-config
```
#### **From External Repo**
| Name | Method | From |
| :- | :- | :- |
| **Git**  | Package | **PPA** git-core |
| **Fastfetch**  | Build | [Github](https://github.com/LinusDierheimer/fastfetch) |
| **Visual Studio Code** | Package | Microsoft Repo |

#### **Optional Install**

**Browser**
| Name | Method | From |
| :- | :- | :- |
| **Google Chrome**  | Package | [Google](https://www.google.com/chrome/) |
| **Ungoogled-Chrome**  | Build | [Github](https://github.com/ungoogled-software/ungoogled-chromium-debian) |
| **Naver Whale** | Package | [Naver Repo](https://repo.whale.naver.com/) |

**Shell**
| Name | Method | Additional |
| :- | :- | :- |
| **Zsh**  | Package | omz, zplug, preset |
| **Fish**  | Package | omf |
### Clean-up
Remove temporary files and packages (Include Thunderbird)

## PsCC-Linux.sh
Install Photoshop CC for Linux   
Photoshop CC v19 installer for Linux  By  Gictorbit
https://github.com/Gictorbit/photoshopCClinux

script include install wine, winetrick   


