#!/bin/bash

echo "Deseja iniciar ou desligar um servico de bd?"
echo "1 - Ligar"
echo "2 - Desligar"
read opcao_liga_desliga

case $opcao_liga_desliga in
   "1")
      echo "Escolha o serviço que quer iniciar: "
      echo "1 - MySQL"
      echo "2 - Postgresql"
      read opcao_servico_ligar
      
      case $opcao_servico_ligar in
         "1")
            echo "Iniciando MySQL..."
            sudo service mysql start
         ;;
         "2")
            echo "Iniciando PostgreSQL..."
            sudo service postgresql start
         ;;
      esac
      ;;
   "2")
      echo "Escolha o serviço que quer desligar: "
      echo "1 - MySQL"
      echo "2 - Postgresql"
      read opcao_servico_desligar
   
      case $opcao_servico_desligar in
         "1")
            echo "Desligando MySQL..."
            sudo service mysql stop
         ;;
         "2")
            echo "Desligando MySQL..."
            sudo service postgresql stop
         ;;
      esac
   ;;
esac
