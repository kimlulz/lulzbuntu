# Compile Linux Kernel
Test on Ubuntu 21.04

## Prepare 
### Install Packages
```
sudo apt update
sudo apt install build-essential libncurses5 libncurses5-dev bin86 kernel-package libssl-dev bison flex libelf-dev ncurses-dev
```


### Check current kernel version
`uname -r`    
```
❯ uname -r
5.11.0-25-generic
```

##Compile
### Download Source from kernel.org
Refer to kernel.org ...    
Extract source to /usr/src
cd /usr/src/linux-[Version]    

### Make .config file
Copy current kernel config.   
`cp /boot/config-5.11.0-25-generic ./.config`   
`sudo make menuconfig` load -> [ok] -> Exit   

### Check Core Count
`grep -c processor /proc/cpuinfo`    
```
❯ grep -c processor /proc/cpuinfo
6
```

## Start compile
sudo make-kpkg -j{Core Count} --initrd --revision=1.0 kernel_image    
`sudo make-kpkg -j6 --initrd --revision=1.0 kernel_image`    

When it finished,   
```
dpkg-deb: building package 'linux-image-5.13.7' in '../linux-image-5.13.7_1.0_amd64.deb'.
```
You can see package in /usr/src

## Install Kernel
`sudo dpkg -i linux-image-5.13.7_1.0_amd64.deb`

## Troubleshooting
### Unable to install kernel-package in Non-LTS Repository
https://packages.ubuntu.com/focal/kernel-package
`sudo dpkg -i kernel-package_13.018+nmu2_all.deb`

### make[1]: *** 'certs/x509_certificate_list ERROR 
Edit kernel configuration file(.config).    
Find `CONFIG_SYSTEM_TRUSTED_KEYS="debian/canonical-certs.pem" and

Change to `CONFIG_SYSTEM_TRUSTED_KEYS=""`

and type `scripts/config --disable SYSTEM_TRUSTED_KEYS` in terminal(/usr/src/{kernel src folder})

### BTF: .tmp_vmlinux.btf: pahole (pahole) is not available ERROR
Install dwarves package    
`sudo apt install dwarves`



