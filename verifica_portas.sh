#!/bin/bash

# Verifica a quantidade de argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <IP inicial> <IP final>"
    exit 1
fi

ip_inicial=$1
ip_final=$2

# Loop sobre os IPs no intervalo
for ((i=ip_inicial;i<=ip_final;i++)); do
    ip="192.168.1.$i"  # Substitua pela sua faixa de IPs

    # Loop sobre as portas de interesse (por exemplo, 80, 443, 22)
    for porta in 80 443 22; do
        nc -z -v -w 1 $ip $porta 2>&1 | grep -q "succeeded" && echo "Porta $porta aberta em $ip"
    done
done
