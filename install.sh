# Base Components

sudo apt install -y nala

# Install Desktop Environment

sudo nala install -y vanilla-gnome-desktop vanilla-gnome-default-settings

# Disable Wayland

sudo sed -i "s/#WaylandEnable=false/WaylandEnable=false/g" /etc/gdm3/custom.conf

# Debloating Vanilla-Gnome

sudo nala remove --purge -y \
ubuntu-mono \
ubuntu-gnome-wallpapers* \
gnome-console \
libreoffice* \
gnome-online-accounts \
gnome-user-docs \
gnome-initial-setup \
simple-scan \
transmission* \
baobab \
gnome-text-editor \
yelp \
seahorse \
aisleriot \
cheese \
gnome-mahjongg \
gnome-mines \
rhythmbox* \
gnome-initial-setup \
gnome-user-docs \
gnome-sudoku \

# Flatpak Setup

sduo nala install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# sudo reboot
