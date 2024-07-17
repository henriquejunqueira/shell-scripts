#!/bin/bash

# Solicita ao usuário que insira o número da porta
echo "Digite o número da porta para ver se está aberta. (Ex: 3000): "
read porta

# Verifica se o usuário forneceu a entrada
if [ -z "$porta" ]; then
   echo "Nenhuma porta fornecida. Saindo..."
   exit 1
fi

# Usa o lsof para listar os processos na porta especificada
sudo lsof -i :${porta}
