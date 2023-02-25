# Base Components

sudo apt install -y nala
sudo apt remove --purge snapd -y
sudo add-apt-repository ppa:mozillateam/ppa -y

# Tweaking APT

sudo mv ./aptPref/spring.pref /etc/apt/preferences.d/

# Install Desktop Environment

sudo nala install -y vanilla-gnome-desktop vanilla-gnome-default-settings

# Disable Wayland

sudo sed -i "s/#WaylandEnable=false/WaylandEnable=false/g" /etc/gdm3/custom.conf

# Flatpak Setup

sudo nala install -y flatpak gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

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
dconf-editor \
deja-dup \
gnome-startup-applications \
usb-creator*

# Remove Some-Shit

sudo rm -r /usr/share/themes/Yaru*

sudo rm -r /usr/share/gnome-shell/extensions/apps-menu@gnome-shell-extensions.gcampax.github.com
sudo rm -r /usr/share/gnome-shell/extensions/auto-move-windows@gnome-shell-extensions.gcampax.github.com
sudo rm -r /usr/share/gnome-shell/extensions/native-window-placement@gnome-shell-extensions.gcampax.github.com
sudo rm -r /usr/share/gnome-shell/extensions/places-menu@gnome-shell-extensions.gcampax.github.com
sudo rm -r /usr/share/gnome-shell/extensions/screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com
sudo rm -r /usr/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com
sudo rm -r /usr/share/gnome-shell/extensions/window-list@gnome-shell-extensions.gcampax.github.com
sudo rm -r /usr/share/gnome-shell/extensions/windowsNavigator@gnome-shell-extensions.gcampax.github.com
sudo rm -r /usr/share/gnome-shell/extensions/workspace-indicator@gnome-shell-extensions.gcampax.github.com

# Download Extensions

wget https://extensions.gnome.org/extension-data/dingrastersoft.com.v54.shell-extension.zip
unzip dingrastersoft.com.v54.shell-extension.zip -d ding@rastersoft.com
sudo mv ding@rastersoft.com /usr/share/gnome-shell/extensions/

wget https://extensions.gnome.org/extension-data/dash-to-paneljderose9.github.com.v52.shell-extension.zip
unzip dash-to-paneljderose9.github.com.v52.shell-extension.zip -d dash-to-panel@jderose9.github.com
sudo mv dash-to-panel@jderose9.github.com /usr/share/gnome-shell/extensions/

# Extensions

gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable launch-new-instance@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable ding@rastersoft.com
gnome-extensions enable dash-to-panel@jderose9.github.com

# sudo reboot
