#!/bin/bash

# Atualiza o sistema
sudo apt update
sudo apt upgrade -y

# Atualiza o GRUB para reconhecer o Windows
sudo update-grub

# Instala codecs e plugins adicionais
sudo apt install ubuntu-restricted-extras -y
sudo apt install libavcodec-extra -y
sudo apt install libdvd-pkg -y
sudo dpkg-reconfigure libdvd-pkg

# Instala o suporte ao Microsoft Fonts
sudo apt install ttf-mscorefonts-installer -y

# Instala o suporte ao Wine para executar aplicativos do Windows
sudo apt install wine -y

# Instala ferramentas de desenvolvimento (opcional)
sudo apt install build-essential -y
sudo apt install git -y

# Limpando pacotes não necessários
sudo apt autoremove -y
sudo apt clean
