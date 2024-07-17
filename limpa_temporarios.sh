#!/bin/bash

# Lista de diretórios onde os arquivos temporários estão localizados
directories=(
    "/tmp"
    "/var/tmp"
)

# Remova arquivos temporários em cada diretório
for dir in "${directories[@]}"; do
    echo "Limpando arquivos temporários em $dir"
    find "$dir" -type f -name '.*' -exec rm -f {} +
done

echo "Limpeza concluída."
