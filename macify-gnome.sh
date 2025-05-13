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

echo "== Instalando Dash to Dock =="
sudo apt install -y gnome-shell-extension-dash-to-dock

echo "== Ativando extensões úteis =="
gnome-extensions enable dash-to-dock@micxgx.gmail.com || true
gnome-extensions enable ubuntu-appindicators@ubuntu.com || true

echo "== Aplicando tema com gsettings =="
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Dark"
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Dark"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur"
gsettings set org.gnome.desktop.interface cursor-theme "WhiteSur-cursors"
gsettings set org.gnome.desktop.interface font-name 'Cantarell 11'

echo "== Movendo dock para baixo =="
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'

echo "== Finalizado! Reinicie a sessão ou o sistema para aplicar tudo =="
