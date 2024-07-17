#!/bin/bash

echo "Selecione o tipo de interface. Ex: eth0 "
read interface
echo "Digite o range de ip. Ex: 192.168.0.0/24 "
read range

sudo netdiscover -i $interface -r $range
