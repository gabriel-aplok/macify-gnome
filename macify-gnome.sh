#!/bin/bash

set -e

echo "== Instalando dependências básicas =="
sudo apt update
sudo apt install -y git gnome-tweaks gnome-shell-extensions chrome-gnome-shell curl unzip

echo "== Instalando tema WhiteSur (GTK e Shell) =="
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh -l
cd ..
rm -rf WhiteSur-gtk-theme

echo "== Instalando ícones WhiteSur =="
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
./install.sh
cd ..
rm -rf WhiteSur-icon-theme

echo "== Instalando cursores WhiteSur =="
git clone https://github.com/vinceliuice/WhiteSur-cursors.git
cd WhiteSur-cursors
./install.sh
cd ..
rm -rf WhiteSur-cursors

echo "== Finalizado! Reinicie a sessão ou o sistema para aplicar tudo =="
