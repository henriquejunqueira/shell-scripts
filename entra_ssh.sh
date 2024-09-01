#!/bin/bash

echo "Usuário: "
read usuario

echo "IP: "
read ipAlvo

ssh -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa $usuario@$ipAlvo
