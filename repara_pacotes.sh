#!/bin/bash

sudo apt update && sudo apt upgrade
sudo apt --fix-broken install
sudo dpkg --remove --force-remove-reinstreq touchpad-indicator
sudo apt remove gconf2-common gconf-service-backend gconf-service gir1.2-gconf-2.0 libgconf-2-4:amd64
sudo apt clean
sudo dpkg --configure -a
