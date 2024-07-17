#!/bin/bash

# Script para limpeza de arquivos temporários e lixo do sistema no Linux

# Limpeza de cache do apt
sudo apt-get clean

# Limpeza do cache do sistema
sudo rm -rf /var/cache/apt/archives/*.deb
sudo rm -rf /var/cache/apt/archives/partial/*

# Limpeza de pacotes antigos
sudo apt-get autoremove --purge

# Limpeza de arquivos temporários de usuário
rm -rf ~/.cache/*
rm -rf ~/.thumbnails/*

# Limpeza de logs antigos
sudo find /var/log -type f -regex '.*\.\(gz\|old\)$' -delete

# Limpeza de cache de navegadores
# Firefox
rm -rf ~/.mozilla/firefox/*/cache/*
rm -rf ~/.mozilla/firefox/*/OfflineCache/*
# Chrome/Chromium
rm -rf ~/.cache/google-chrome/*
rm -rf ~/.config/google-chrome/Default/Cache/*
rm -rf ~/.config/google-chrome/Default/Media\ Cache/*
rm -rf ~/.cache/chromium/*
rm -rf ~/.config/chromium/Default/Cache/*
rm -rf ~/.config/chromium/Default/Media\ Cache/*

# Limpeza de cache de outros programas dentro de ~/.config
for app_dir in ~/.config/*; do
    if [ -d "$app_dir" ]; then
        app_name=$(basename "$app_dir")
        echo "Limpando cache de $app_name"
        rm -rf "$app_dir"/*
    fi
done

echo "Limpeza concluída."
