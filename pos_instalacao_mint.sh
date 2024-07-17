#!/bin/bash
sudo apt update && sudo apt upgrade
sudo gufw
sudo apt install mint-meta-codecs
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi google-chrome*
