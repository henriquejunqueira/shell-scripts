#!/bin/bash

echo "Digite o range de IPs: "
read range

echo "Digite o caminho completo para o arquivo de saída. Ex: /home/labu/Documentos/scan.txt: "
read arquivo

nmap -sP $range | grep for | cut -d " " -f5-35 > $arquivo

echo "Deseja exibir o resultado do scan? (s/n)"
read opcao

if ([ $opcao == "s"  ] || [ $opcao == "S" ]);
then
   clear

   echo "### Hosts ativos na rede ###"
   echo
   cat $arquivo
   echo
   echo "############################"
   echo
fi
