#!/bin/bash
#Author: Henrique Junqueira

#Desabilitar qualquer processo de swap que esteja ativo (Disable any swap process that is active)
sudo swapoff -a

#Alocar o espaço em disco destinado à área de swap (Allocate disk space for the swap area)
echo "Digite em GB o tamanho que deseja para o swap. Ex: 2"
read tamanho_swap

sudo fallocate -l ${tamanho_swap}G /swapfile

#Alterar as permissões para que o arquivo seja acessível somente ao usuário root (Change permissions so that the file is only accessible to the root user)
sudo chmod 600 /swapfile

#Indicar que o arquivo criado é destinado ao swap (Indicate that the created file is intended for swap)
sudo mkswap /swapfile

#Habilitar o espaço para uso pelo sistema (Enable the space for use by the system)
sudo swapon /swapfile

#Se os comandos forem bem sucedidos, ao verificar o status novamente, ele deverá indicar a nova área alocada (If the commands are successful, when checking the status again it should indicate the new allocated area)
sudo swapon --show

#Para tornar o arquivo e as configurações definidas permanentes (To make the defined file and settings permanent)
sudo cp /etc/fstab /etc/fstab.bak

#Este comando adiciona a linha '/swapfile none swap sw 0 0' ao final do arquivo /etc/fstab, garantindo que o swapfile seja montado durante a inicialização do sistema. (This command adds the line '/swapfile none swap sw 0 0' to the end of the /etc/fstab file, ensuring that the swapfile is mounted during system startup.)
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
