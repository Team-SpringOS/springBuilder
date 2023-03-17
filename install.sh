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

# Install Minimal Desktop Environment

sudo apt install -y vanilla-gnome-desktop vanilla-gnome-default-settings flatpak gedit \
aisleriot- baobab- brltty- cheese- deja-dup- firefox- fonts-indic- fonts-kacst-one- fonts-khmeros-core- fonts-lao- fonts-liberation- \
fonts-lklug-sinhala- fonts-noto-cjk- fonts-sil-abyssinica- fonts-sil-padauk- fonts-thai-tlwg- fonts-tibetan-machine- fonts-ubuntu- fwupd- \
fwupd-signed- gnome-accessibility-themes- gnome-calendar- gnome-characters- gnome-contacts- gnome-disk-utility- gnome-initial-setup- \
gnome-mahjongg- gnome-maps- gnome-mines- gnome-photos- gnome-sudoku- gnome-sushi- gnome-text-editor- gnome-weather- gvfs-fuse- \
libreoffice-calc- libreoffice-gnome- libreoffice-impress- libreoffice-math- libreoffice-ogltrans- libreoffice-pdfimport- \
libreoffice-style-tango- libreoffice-writer- mousetweaks- rhythmbox- seahorse- simple-scan- snapd- speech-dispatcher- totem- transmission-gtk- \
ubuntu-gnome-wallpapers- usb-creator-gtk

sudo nala remove --purge -y ubuntu-mono gnome-todo usb-creator-gtk gnome-tweaks usb-creator-common gnome-online-accounts yelp gnome-user-docs dconf-editor gnome-startup-applications gnome-shell-extension-prefs

# Disable Wayland

sudo sed -i "s/#WaylandEnable=false/WaylandEnable=false/g" /etc/gdm3/custom.conf

# Flatpak Setup

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Download Extensions

wget https://extensions.gnome.org/extension-data/dingrastersoft.com.v54.shell-extension.zip
unzip dingrastersoft.com.v54.shell-extension.zip -d ding@rastersoft.com
sudo mv ding@rastersoft.com $SYS_ENTENSIONS/

wget https://extensions.gnome.org/extension-data/dash-to-paneljderose9.github.com.v52.shell-extension.zip
unzip dash-to-paneljderose9.github.com.v52.shell-extension.zip -d dash-to-panel@jderose9.github.com
sudo mv dash-to-panel@jderose9.github.com $SYS_ENTENSIONS/

wget https://extensions.gnome.org/extension-data/start-overlay-in-application-viewHex_cz.v4.shell-extension.zip
unzip start-overlay-in-application-viewHex_cz.v4.shell-extension.zip -d start-overlay-in-application-view@Hex_cz
sudo mv start-overlay-in-application-view@Hex_cz $SYS_ENTENSIONS/

wget https://extensions.gnome.org/extension-data/no-overviewfthx.v12.shell-extension.zip
unzip no-overviewfthx.v12.shell-extension.zip -d no-overview@fthx
sudo mv no-overview@fthx $SYS_ENTENSIONS/

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
gnome-extensions enable start-overlay-in-application-view@Hex_cz
gnome-extensions enable no-overview@fthx

# Minor Tweaks

sudo sed -i "s/Name=gedit/Name=Text Editor/g" /usr/share/applications/org.gnome.gedit.desktop

sudo rm -r /usr/share/themes/Yaru*

sudo rm -r $SYS_ENTENSIONS/apps-menu@gnome-shell-extensions.gcampax.github.com
sudo rm -r $SYS_ENTENSIONS/auto-move-windows@gnome-shell-extensions.gcampax.github.com
sudo rm -r $SYS_ENTENSIONS/native-window-placement@gnome-shell-extensions.gcampax.github.com
sudo rm -r $SYS_ENTENSIONS/places-menu@gnome-shell-extensions.gcampax.github.com
sudo rm -r $SYS_ENTENSIONS/screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com
sudo rm -r $SYS_ENTENSIONS/user-theme@gnome-shell-extensions.gcampax.github.com
sudo rm -r $SYS_ENTENSIONS/window-list@gnome-shell-extensions.gcampax.github.com
sudo rm -r $SYS_ENTENSIONS/windowsNavigator@gnome-shell-extensions.gcampax.github.com
sudo rm -r $SYS_ENTENSIONS/workspace-indicator@gnome-shell-extensions.gcampax.github.com

sudo rm /usr/share/plymouth/ubuntu-logo.png

sudo rm '/usr/share/pixmaps/ubuntu-logo-text-dark.png'
sudo rm '/usr/share/pixmaps/ubuntu-logo-text.png'
sudo rm '/usr/share/pixmaps/ubuntu-logo-icon.png'
sudo rm '/usr/share/pixmaps/ubuntu-logo-dark.png'
sudo rm '/usr/share/pixmaps/ubuntu-logo.svg'

sudo rm /etc/os-release
sudo mv ./release /etc/os-release

# Wallpaper

sudo rm -r /usr/share/backgrounds/*
sudo cp ./Wallpaper/* /usr/share/backgrounds/
gsettings set org.gnome.desktop.background picture-uri '/usr/share/backgrounds/SpringOS-default.jpg'


# App-Menu Tweaks

gsettings set org.gnome.desktop.app-folders folder-children "['Tools']"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Tools/ name 'Tools & Utilities'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Tools/ apps "['nm-connection-editor.desktop','org.gnome.font-viewer.desktop', 'org.gnome.Logs.desktop', 'org.gnome.eog.desktop', 'org.gnome.Evince.desktop', 'org.gnome.FileRoller.desktop', 'org.gnome.Terminal.desktop', 'gnome-language-selector.desktop', 'software-properties-gtk.desktop']"

dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop']"

cd ..
sudo rm -r springBuilder && sudo reboot
