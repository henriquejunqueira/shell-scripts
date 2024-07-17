#!/bin/bash

sudo rm /var/lib/apt/lists/lock

sudo rm /var/lib/dpkg/lock

sudo rm /var/lib/dpkg/lock-frontend

sudo dpkg --configure -a

sudo apt clean

sudo apt update --fix-missing

sudo apt install -f

sudo dpkg --configure -a

sudo apt upgrade

sudo apt dist-upgrade

echo "O sistema precisa ser reiniciado. Reiniciar agora? (s/n): "
read opcao

if [ ${opcao} == "s" ]; 
then
   sudo reboot now
elif [ ${opcao} == "S" ] ]; 
then
   sudo reboot now
fi
