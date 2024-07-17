#!/bin/bash

echo "1. Codificar para Binário"
echo "2. Decodificar Binário"
echo "3. Codificar para Hexadecimal"
echo "4. Decodificar Hexadecimal"
echo "5. Sair"

read -p "Escolha uma opção (1/2/3/4/5): " opcao

case $opcao in
    1)
        read -p "Digite o texto para codificar em binário: " texto
        resultado=""
        for ((i=0; i<${#texto}; i++)); do
            resultado+="$(printf "%08s" $(echo -n "${texto:$i:1}" | xxd -b | awk '{print $2}'))"
        done
        echo "Texto codificado em Binário: $resultado"
        ;;
    2)
        read -p "Digite o texto binário para decodificar: " texto_binario
        resultado=""
        for ((i=0; i<${#texto_binario}; i+=8)); do
            resultado+="$(echo -n "${texto_binario:$i:8}" | perl -lape '$_=pack"B8",$_' 2>/dev/null)"
        done
        echo "Texto decodificado: $resultado"
        ;;
    3)
        read -p "Digite o texto para codificar em hexadecimal: " texto
        resultado=$(echo -n "$texto" | xxd -p | tr -d '\n')
        echo "Texto codificado em Hexadecimal: $resultado"
        ;;
    4)
        read -p "Digite o texto hexadecimal para decodificar: " texto_hex
        echo "$texto_hex" | xxd -r -p 2>/dev/null
        ;;
    5)
        echo "Saindo do script."
        exit 0
        ;;
    *)
        echo "Opção inválida. Saindo do script."
        exit 1
        ;;
esac

