#!/bin/bash

# Executa o comando apt list --upgradable e redireciona a saída para um arquivo temporário
apt list --upgradable > /tmp/upgradable_packages.txt

# Verifica se o arquivo temporário foi criado com sucesso
if [ $? -eq 0 ]; then
    echo "Lista de pacotes atualizada."
else
    echo "Erro ao obter a lista de pacotes atualizáveis."
    exit 1
fi

# Lê o arquivo temporário linha por linha
while IFS= read -r line; do
    # Verifica se a linha contém um pacote atualizável
    if [[ $line == *"/"* ]]; then
        # Extrai o nome do pacote da linha
        package=$(echo $line | cut -d '/' -f 1)
        # Adiciona o nome do pacote à lista de pacotes a serem atualizados
        packages_to_update+=" $package"
    fi
done < /tmp/upgradable_packages.txt

# Remove o arquivo temporário
rm /tmp/upgradable_packages.txt

# Executa o comando apt upgrade com a lista de pacotes a serem atualizados
if [ -n "$packages_to_update" ]; then
    echo "Atualizando os pacotes: $packages_to_update"
    sudo apt upgrade $packages_to_update
else
    echo "Não há pacotes para atualizar."
fi