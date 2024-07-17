#!/bin/bash

sudo ufw enable

sudo systemctl enable ufw

sudo systemctl start ufw

echo "Reiniciar agora? [s/n]"
read opcao

if [[ $opcao = "s" ]] || [[ $opcao = "S" ]]; then
   sudo reboot now
else
   exit
fi

