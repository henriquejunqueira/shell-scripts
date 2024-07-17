#!/bin/bash

sudo fdisk -l

echo "Digite o nome do disco. Ex: /dev/sda1 "
read disco

echo "Selecione o tipo de teste: "
echo "Digite 1 para teste rápido"
echo "Digite 2 para teste completo"
read opcao

#-s = Mostra o avanço do procedimento
#-v = verbose mode
#-c 10240 = Verifica 10 mil blocos de HD por vez
#-n = non-destructive read-write
#-w = destructive write-mode

if [ "$opcao" -eq "1" ];
then
   #executa o teste por BadBlocks apenas por leitura de informações
   sudo badblocks -sv -c 1024 $disco
else
   #testa o HD lendo, escrevendo e também verificando as informações
   sudo badblocks -nsv -c 10240 $disco
fi

