#!/bin/bash
#curl -OL https://github.com/DisLogicator/hoffice/releases/download/11.20.0.1520-3/hoffice-11.20.0.1520-3.tar.gz
curl -L https://github.com/DisLogicator/hoffice/releases/download/11.20.0.1520-3/hoffice-11.20.0.1520-3.tar.gz > hoffice.tar.gz
tar -zcvf hoffice.tar.gz hoffice
cd hoffice
unzip hoffice11.zip
#unzip hoffice11.zip -d /opt/hnc/hoffice11
sudo mv hoffice11 /opt/hnc/hoffice11
sudo mv *.desktop /usr/share/applications
sudo mv *.png /opt/hnc/icons
echo "Finished"