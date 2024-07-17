#!/bin/bash

echo "1. Codificar em Base64"
echo "2. Decodificar Base64"
echo "3. Sair"

read -p "Escolha uma opção (1/2/3): " opcao

case $opcao in
    1)
        read -p "Digite o texto para codificar: " texto
        resultado=$(echo -n "$texto" | base64)
        echo "Texto codificado em Base64: $resultado"
        ;;
    2)
        read -p "Digite o texto para decodificar: " texto_codificado
        resultado=$(echo -n "$texto_codificado" | base64 -d 2>/dev/null)
        if [ $? -eq 0 ]; then
            echo "Texto decodificado: $resultado"
        else
            echo "Erro ao decodificar. Certifique-se de que o texto está codificado em Base64."
        fi
        ;;
    3)
        echo "Saindo do script."
        exit 0
        ;;
    *)
        echo "Opção inválida. Saindo do script."
        exit 1
        ;;
esac
