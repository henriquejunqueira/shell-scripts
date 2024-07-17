#!/bin/bash

# Verificar se o NVM está disponível
#if ! command -v nvm &> /dev/null
#then
#    echo "NVM não está instalado. Por favor, instale-o primeiro."
#    exit
#fi

echo "Selecione a versão do Node.js:"
echo "1 - Node.js v16.6.2"
echo "2 - Node.js v18.14.2"
echo "3 - Node.js v20.12.1"
read opcao_node

if [ "$opcao_node" == "1" ]; then
   nvm use v16.6.2
elif [ "$opcao_node" == "2" ]; then
   nvm use v18.14.2
elif [ "$opcao_node" == "3" ]; then
   nvm use v20.12.1
else
   echo "Opção inválida."
fi
