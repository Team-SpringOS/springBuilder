SYS_ENTENSIONS=/usr/share/gnome-shell/extensions

# Base Components

sudo apt update && sudo apt upgrade -y

sudo apt install -y nala preload tlp make node-typescript
sudo apt remove --purge snapd -y
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo nala fetch --auto -y

sudo systemctl start tlp-service
sudo systemctl enable tlp-service

# Tweaking APT

sudo mv ./aptPref/spring.pref /etc/apt/preferences.d/

# Install Desktop Environment

sudo nala install -y vanilla-gnome-desktop vanilla-gnome-default-settings gedit

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
usb-creator* \
gnome-shell-extension-prefs 

# Download Extensions

wget https://extensions.gnome.org/extension-data/dingrastersoft.com.v54.shell-extension.zip
unzip dingrastersoft.com.v54.shell-extension.zip -d ding@rastersoft.com
sudo mv ding@rastersoft.com SYS_ENTENSIONS/

wget https://extensions.gnome.org/extension-data/dash-to-paneljderose9.github.com.v52.shell-extension.zip
unzip dash-to-paneljderose9.github.com.v52.shell-extension.zip -d dash-to-panel@jderose9.github.com
sudo mv dash-to-panel@jderose9.github.com SYS_ENTENSIONS/

wget https://extensions.gnome.org/extension-data/start-overlay-in-application-viewHex_cz.v4.shell-extension.zip
unzip start-overlay-in-application-viewHex_cz.v4.shell-extension.zip -d start-overlay-in-application-view@Hex_cz
sudo mv start-overlay-in-application-view@Hex_cz SYS_ENTENSIONS/

wget https://extensions.gnome.org/extension-data/no-overviewfthx.v12.shell-extension.zip
unzip no-overviewfthx.v12.shell-extension.zip -d no-overview@fthx
sudo mv no-overview@fthx SYS_ENTENSIONS/

# Pop-Shell Auto-Titling

git clone https://github.com/pop-os/shell
cd shell
make local-install
cd ..
sudo rm -r shell

# Extensions

gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable launch-new-instance@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable ding@rastersoft.com
gnome-extensions enable dash-to-panel@jderose9.github.com

# Minor Tweaks

sudo sed -i "s/Name=gedit/Name=Text Editor/g" /usr/share/applications/org.gnome.gedit.desktop

sudo rm -r /usr/share/themes/Yaru*

sudo rm -r SYS_ENTENSIONS/apps-menu@gnome-shell-extensions.gcampax.github.com
sudo rm -r SYS_ENTENSIONS/auto-move-windows@gnome-shell-extensions.gcampax.github.com
sudo rm -r SYS_ENTENSIONS/native-window-placement@gnome-shell-extensions.gcampax.github.com
sudo rm -r SYS_ENTENSIONS/places-menu@gnome-shell-extensions.gcampax.github.com
sudo rm -r SYS_ENTENSIONS/screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com
sudo rm -r SYS_ENTENSIONS/user-theme@gnome-shell-extensions.gcampax.github.com
sudo rm -r SYS_ENTENSIONS/window-list@gnome-shell-extensions.gcampax.github.com
sudo rm -r SYS_ENTENSIONS/windowsNavigator@gnome-shell-extensions.gcampax.github.com
sudo rm -r SYS_ENTENSIONS/workspace-indicator@gnome-shell-extensions.gcampax.github.com

sudo rm /usr/share/plymouth/ubuntu-logo.png

sudo rm '/usr/share/pixmaps/ubuntu-logo-text-dark.png'
sudo rm '/usr/share/pixmaps/ubuntu-logo-text.png'
sudo rm '/usr/share/pixmaps/ubuntu-logo-icon.png'
sudo rm '/usr/share/pixmaps/ubuntu-logo-dark.png'
sudo rm '/usr/share/pixmaps/ubuntu-logo.svg'

sudSYS_ENTENSIONSo rm /etc/os-release
sudo mv ./release /etc/os-release

# Wallpaper

sudo rm -r /usr/share/backgrounds/*
sudo cp ./Wallpaper/* /usr/share/backgrounds/
gsettings set org.gnome.desktop.background picture-uri '/usr/share/backgrounds/SpringOS-default.jpg'

cd ..
sudo rm -r springBuilder && sudo reboot
