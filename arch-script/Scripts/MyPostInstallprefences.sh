#!/bin/bash

#info
echo This script is for Arch based distros using Plasma KDE.

#Install required packages
echo Installing required packages to run this script.
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg -si --noconfirm
sudo aura -Syu

#Installing DE
echo Installing DE.
sudo aura -S ark breeze-gtk dbus-python kate kde-gtk-config khotkeys kinfocenter kinit kio-fuse konsole kscreen plasma-desktop plasma-disks plasma-nm plasma-pa powerdevil sddm-kcm spectacle nemo --needed --noconfirm

#Installing helpful apps
echo Installing helpful apps.
sudo aura -S bluez bluez-utils blueman pulseaudio-bluetooth bpytop neofetch --needed --noconfirm
systemctl enable bluetooth.service

#Customization tools
echo installing customization tools
sudo aura -S plank

#Install my fav apps
echo Installing my fav apps
sudo aura -S vivaldi discord elisa --needed --noconfirm
sudo aura -A youtube-dl-gui-git exercism-bin --needed --noconfirm

#Install Spotify
echo Installing spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
git clone https://aur.archlinux.org/spotify.git
    #remove last command from PKGBUILD... this fixes the PKGBUILD file so it will build
sudo sed '/chmod -R go-w "${pkgdir}"/d' /home/$USER/spotify/PKGBUILD
cd spotify
makepkg -si --noconfirm
cd
sudo aura -A spotify-adblock --noconfirm

#install my fav game resourses
echo Installing my fav game resourses
sudo aura -S amd-ucode amdvlk xf86-video-amdgpu lib32-amdvlk mesa mesa-demos lib32-mesa xdelta3 steam lutris wine winetricks --needed --noconfirm
sudo aura -A dxvk-bin heroic-games-launcher-bin mangohud-common-git goverlay-git --needed --noconfirm
setup_dxvk install

# Final message
echo All application have been installed, the script will now quit.
 
# Exit the script
exit 0
