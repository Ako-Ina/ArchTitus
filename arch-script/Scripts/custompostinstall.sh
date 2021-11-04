#!/bin/bash

echo
echo About Script:
echo
echo Welcome to the Custom Arch install script. This script will ask you questions on what package you like to install.
echo For this script to work please have arch installed on your machine before hand.
echo
echo
echo Verifying if scriptis being run in root.
error() {
  printf '\E[31m'; echo "$@"; printf '\E[0m'
}

if [[ $EUID -eq 0 ]]; then
    error "Do not run this as the root user"
    exit 1
fi
echo
echo Cheaking if you have the latest packages repros
echo
sudo pacman -Syu --noconfirm
echo
echo Cheaking if you have the required packageto run this script
sleep 1
[ "$(command -v git)" ] || {
  error "git is not installed, installing..."
sudo pacman -S git --noconfirm
}
echo
[ "$(command -v aura)" ] || {
  error "Aura Package Manager is is not installed, installing..."
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg -si
}
echo
echo NOTE: PACKAGES WILL BE INSTALLED AFETR YOU HAVE PICKED ALL THE APPS YOU WOULD LIKE TO BE INSTALLED
echo
read -p "Press Enter/Return to continue, or [CTRL+C] to exit script: "

#PM choosier

choice () {
    local choice=$1
    if [[ ${PM[choice]} ]] # toggle
    then
        PM[choice]=
    else
        PM[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Disclamer:
echo Please install Aura as this script requires it so select 1 and what other package Manager you want.
echo Choose your Package Manager:

    options=(
    "Aura - Arch package installer and AUR installer Arch Based Distro Only ${PM[1]}"
    "Discover - Graphic Interface Package Manager Recommended to use with KDE Plasma Desktop Enviorment ${PM[2]}"
    "Yay - AUR Installer Arch Only ${PM[3]}"
    "Pamac - Graphic Interface Package Manager Arch Based Distros Only ${PM[4]}"
    "Snap - Service and tools for management of snap packages. ${PM[5]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Aura - Arch package installer and AUR installer Arch Based Distro Only ${PM[1]}")
                choice 1
                break
                ;;
            "Discover - Graphic Interface Package Manager Recommended to use with KDE Plasma Desktop Enviorment ${PM[2]}")
                choice 2
                break
                ;;
            "Yay - AUR Installer Arch Only ${PM[3]}")
                choice 3
                break
                ;;
            "Pamac - Graphic Interface Package Manager Arch Based Distros Only ${PM[4]}")
                choice 4
                break
                ;;
            "Snap - Service and tools for management of snap packages. ${PM[5]}")
                choice 5
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!PM[@]}"
do
    if [[ ${PM[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done


#user choise scripts for DE

choice () {
    local choice=$1
    if [[ ${DE[choice]} ]] # toggle
    then
        DE[choice]=
    else
        DE[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Choose your Desktop Enviorment:

    options=(
    "Budgie -  Desktop Environment, you can mix modernity and traditions. Based on a classical display and an all-in-one settings bar for music, video and more. For Budgie, we recommend a minimum of 4 GB of RAM. ${DE[1]}"
    "Cinnamon - is a Linux desktop environment reminiscent of GNOME 2 that offers flexibility and speed. For Cinnamon, we recommend 4GB of RAM and up for a smooth experience. ${DE[2]}"
    "Gnome - Is a modern and customizable Desktop Environment that lets you get things done. For Gnome, we recommend a minimum of 4 GB of RAM for a smooth experience. ${DE[3]}"
    "lxqt - LXQt is a lightweight Qt desktop environment that will not get in your way, so it will not hang or slow down your system. It is focused on being a classic desktop with a modern look and feel. LXQt works on a minimum of 2GB of RAM, but for a smoother experience we recommend 4GB of RAM. ${DE[4]}"
    "Mate - A lightweight Desktop Environment that supports newer technologies with a traditional Desktop. Mate works with a minimum of 2 GB of RAM, but for a smoother experience we recommend 4GB of RAM. ${DE[5]}"
    "Plasma - HIGHLY RECEMENDED FOR NEW LINUX USERS! Plasma is made to stay out of the way as it helps you get things done. But under its light and intuitive surface, it’s a powerhouse. So you’re free to choose ways of usage right as you need them and when you need them. For Plasma, we recommend a minimum of 4 GB of RAM. ${DE[6]}"
    "xfce4 - A highly customizable and lightweight Desktop Environment with a traditional touch and feel. The perfect choice for lower specs hardware that requires a minimum of 2 GB of RAM, but for a smooth experience we recommend 4 GB of RAM. ${DE[7]}"
    "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Budgie -  Desktop Environment, you can mix modernity and traditions. Based on a classical display and an all-in-one settings bar for music, video and more. For Budgie, we recommend a minimum of 4 GB of RAM. ${DE[1]}")
                choice 2
                break
                ;;
            "Cinnamon - is a Linux desktop environment reminiscent of GNOME 2 that offers flexibility and speed. For Cinnamon, we recommend 4GB of RAM and up for a smooth experience. ${DE[2]}")
                choice 2
                break
                ;;
            "Gnome - Is a modern and customizable Desktop Environment that lets you get things done. For Gnome, we recommend a minimum of 4 GB of RAM for a smooth experience. ${DE[3]}")
                choice 3
                break
                ;;

            "lxqt - LXQt is a lightweight Qt desktop environment that will not get in your way, so it will not hang or slow down your system. It is focused on being a classic desktop with a modern look and feel. LXQt works on a minimum of 2GB of RAM, but for a smoother experience we recommend 4GB of RAM. ${DE[4]}")
                choice 4
                break
                ;;
                "Mate - A lightweight Desktop Environment that supports newer technologies with a traditional Desktop. Mate works with a minimum of 2 GB of RAM, but for a smoother experience we recommend 4GB of RAM. ${DE[5]}")
                choice 5
                break
                ;;
                "Plasma - HIGHLY RECEMENDED FOR NEW LINUX USERS! Plasma is made to stay out of the way as it helps you get things done. But under its light and intuitive surface, it’s a powerhouse. So you’re free to choose ways of usage right as you need them and when you need them. For Plasma, we recommend a minimum of 4 GB of RAM. ${DE[6]}")
                choice 6
                break
                ;;
                "xfce4 - A highly customizable and lightweight Desktop Environment with a traditional touch and feel. The perfect choice for lower specs hardware that requires a minimum of 2 GB of RAM, but for a smooth experience we recommend 4 GB of RAM. ${DE[7]}")
                choice 7
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!DE[@]}"
do
    if [[ ${DE[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done
echo

#add if else statments for DE

#Driver Chooser

choice () {
    local choice=$1
    if [[ ${drivers[choice]} ]] # toggle
    then
        drivers[choice]=
    else
        drivers[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Choose your drivers:

    options=(
    "Intel CPU ${drivers[1]}"
    "Intel GPU ${drivers[2]}"
    "AMD CPU ${drivers[3]}"
    "AMD GPU ${drivers[4]}"
    "Nvidia Open Sourse ${drivers[5]}"
    "Nvidia Closed Sourse - Latest featues/better preformance ${drivers[6]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Intel CPU ${drivers[1]}")
                choice 1
                break
                ;;
            "Intel GPU ${drivers[2]}")
                choice 2
                break
                ;;
            "AMD CPU ${drivers[3]}")
                choice 3
                break
                ;;
            "AMD GPU ${drivers[4]}")
                choice 4
                break
                ;;
            "Nvidia Open Sourse ${drivers[5]}")
                choice 5
                break
                ;;
            "Ncidia Close Sourse - Latest featues/better preformance ${drivers[6]}")
                choice 6
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!drivers[@]}"
do
    if [[ ${drivers[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#add if else statments

#customization tools choosier

choice () {
    local choice=$1
    if [[ ${CT[choice]} ]] # toggle
    then
        CT[choice]=
    else
        CT[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Please choose your customization tools:

    options=(
    "Plank - Elegant, simple, clean dock. lightweight Mac like taskbar ${CT[1]}"
    "Kvantum - SVG-based theme engine for Qt5. Helps better with themes. Plasma KDE Only ${CT[2]}"
    "Latte - A dock based on Plasma Frameworks. Mac like taskbar. Plasma KDE Only ${CT[3]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Plank - Elegant, simple, clean dock. lightweight Mac like taskbar ${CT[1]}")
                choice 1
                break
                ;;
            "Kvantum - SVG-based theme engine for Qt5. Helps better with themes. Plasma KDE Only ${CT[2]}")
                choice 2
                break
                ;;
            "Latte - A dock based on Plasma Frameworks. Mac like taskbar. Plasma KDE Only ${CT[3]}")
                choice 3
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!CT[@]}"
do
    if [[ ${CT[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#add if else statments

#Enable Blutooth?
echo
choice () {
    local choice=$1
    if [[ ${bluetooth[choice]} ]] # toggle
    then
        bluetooth[choice]=
    else
        bluetooth[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Please deside if you want to enable bluetooth:

    options=(
    "Yes ${bluetooth[1]}"
    "No ${bluetooth[2]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Yes ${bluetooth[1]}")
                choice 1
                break
                ;;
            "No ${bluetooth[2]}")
                choice 2
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done
echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!CT[@]}"
do
    if [[ ${CT[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#helpful apps choosier

choice () {
    local choice=$1
    if [[ ${HA[choice]} ]] # toggle
    then
        HA[choice]=
    else
        HA[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Please choose your helpful apps:

    options=(
    "neofetch - System stats ${HA[1]}"
    "bpytop - Resource monitor that shows usage and stats for processor, memory, disks, network and processes ${HA[2]}"
    "htop - Interactive process viewer ${HA[3]}"
    "youtube-dl-gui - Downloads YT vids for free via links" ${HA[4]} "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Neofetch - System stats ${HA[1]}")
                choice 1
                break
                ;;
            "bpytop - Resource monitor that shows usage and stats for processor, memory, disks, network and processes ${HA[2]}")
                choice 2
                break
                ;;
            "htop - Interactive process viewer ${HA[3]}")
                choice 3
                break
                ;;
            "Youtube-dl-gui - Downloads YT vids for free via links ${HA[4]}")
                choice 4
                break
                ;;
            "Done")
                break 2
                ;;

            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!HA[@]}"
do
    if [[ ${HA[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#add if else statments

#file manager choosier

choice () {
    local choice=$1
    if [[ ${FM[choice]} ]] # toggle
    then
        FM[choice]=
    else
        FM[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Please choose your helpful apps:

    options=(
    "Dolphin - KDE File Manager ${FM[1]}"
    "Nemo - Cinnamon file manager ${FM[2]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Dolphin - KDE File Manager ${FM[1]}")
                choice 1
                break
                ;;
            "Nemo - Cinnamon file manager ${FM[2]}")
                choice 2
                break
                ;;
            "Done")
                break 2
                ;;

            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!FM[@]}"
do
    if [[ ${FM[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#add if else statments

#text/code choosier

choice () {
    local choice=$1
    if [[ ${TCE[choice]} ]] # toggle
    then
        TCE[choice]=
    else
        TCE[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Please choose your text/code editor:

    options=(
    "Kate - Advanced Text Editor ${TCE[1]}"
    "Xed - A small and lightweight text editor. X-Apps Project ${TCE[2]}"
    "KDevelop - A cross-platform IDE for C, C++, Python, QML/JavaScript and PHP ${TCE[3]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Kate - Advanced Text Editor ${TCE[1]}")
                choice 1
                break
                ;;
            "Xed - A small and lightweight text editor. X-Apps Project ${TCE[2]}")
                choice 2
                break
                ;;

            "KDevelop - A cross-platform IDE for C, C++, Python, QML/JavaScript and PHP ${TCE[3]}")
                choice 3
                break
                ;;
            "Done")
                break 2
                ;;

            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!TCE[@]}"
do
    if [[ ${TCE[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#add if else statments

#terminal choosier

choice () {
    local choice=$1
    if [[ ${T[choice]} ]] # toggle
    then
        T[choice]=
    else
        T[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Please choose your terminal:

    options=(
    "Konsole - KDE terminal emulator ${T[1]}"
    "XTerm - X terminal emulator ${T[2]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Konsole - KDE terminal emulator ${T[1]}")
                choice 1
                break
                ;;
            "XTerm - X terminal emulator ${T[2]}")
                choice 2
                break
                ;;
            "Done")
                break 2
                ;;

            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!T[@]}"
do
    if [[ ${T[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#add if else statments

#music player choices

choice () {
    local choice=$1
    if [[ ${MP[choice]} ]] # toggle
    then
        MP[choice]=
    else
        MP[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Please choose your music player:

    options=(
    "Spotify - A proprietary music streaming service ${MP[1]}"
    "Spotify-adblocker - blocks spotify ads ${MP[2]}"
    "Elisa - A simple music player aiming to provide a nice experience for its users. KDE Plasma Only ${MP[3]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Konsole - KDE terminal emulator ${MP[1]}")
                choice 1
                break
                ;;
            "XTerm - X terminal emulator ${MP[2]}")
                choice 2
                break
                ;;
            "Elisa - A simple music player aiming to provide a nice experience for its users. KDE Plasma Only ${MP[3]}")
                choice 3
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!MP[@]}"
do
    if [[ ${MP[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#add if else statments

#web browser choosier

choice () {
    local choice=$1
    if [[ ${WB[choice]} ]] # toggle
    then
        WB[choice]=
    else
        WB[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Choose your web browser:

    options=(
    "Vialdi - An advanced browser made with the power user in mind ${WB[1]}"
    "Firefox - Standalone web browser from mozilla.org ${WB[2]}"
    "Brave - Web browser that blocks ads and trackers by default ${WB[3]}"
    "Chrome - The popular and trusted web browser by Google ${WB[4]}"
    "Chromium - A web browser built for speed, simplicity, and awcurity ${WB[5]}"
    "Ungoogled Chromium - A lightweight approach to removing Google web services dependencys ${WB[6]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Vialdi - An advanced browser made with the power user in mind ${WB[1]}")
                choice 1
                break
                ;;
            "Discover - Graphic Interface Package Manager Recommended to use with KDE Plasma Desktop Enviorment ${WB[2]}")
                choice 2
                break
                ;;
            "Brave - Web browser that blocks ads and trackers by default ${WB[3]}")
                choice 3
                break
                ;;
            "Chrome - The popular and trusted web browser by Google ${WB[4]}")
                choice 4
                break
                ;;
            "Chromium - A web browser built for speed, simplicity, and awcurity ${WB[5]}")
                choice 5
                break
                ;;
            "Ungoogled Chromium - A lightweight approach to removing Google web services dependencys $WB")
                choice 6
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!WB[@]}"
do
    if [[ ${WB[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#add if else statments

#conmunications tools choosier

choice () {
    local choice=$1
    if [[ ${C[choice]} ]] # toggle
    then
        C[choice]=
    else
        C[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Choose your cummunications tools:

    options=(
    "Discord - All-in-one voice and text chat for gamers that is free and secure. ${C[1]}"
    "Revolt - User-first chat platform built with modern web technologies. Great alternitve to discord. ${C[2]}"
    "Telegram - ${C[3]}"
    "Skype - ${C[4]}"
    "Microsoft Teams - ${C[5]}"
    "Slack - ${C[6]}"
    "Signal - ${C[7]}"
    "Session - ${C[8]}"
    "Element - ${C[9]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Discord - All-in-one voice and text chat for gamers that is free and secure. ${C[1]}")
                choice 1
                break
                ;;
            "Revolt - User-first chat platform built with modern web technologies. Great alternitve to discord. ${C[2]}")
                choice 2
                break
                ;;
            "Telegram -  ${C[3]}")
                choice 3
                break
                ;;
            "Skype -  ${C[4]}")
                choice 4
                break
                ;;
            "Microsoft Teams -  ${C[5]}")
                choice 5
                break
                ;;
            "Slack - ${C[6]}")
                choice 6
                break
                ;;
            "Signal -  ${C[7]}")
                choice 7
                break
                ;;
            "Session -  ${C[8]}")
                choice 8
                break
                ;;
            "Element -  ${C[9]}")
                choice 9
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!C[@]}"
do
    if [[ ${C[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done
echo

#add if else statments

#game launcher choosier

choice () {
    local choice=$1
    if [[ ${GL[choice]} ]] # toggle
    then
        GL[choice]=
    else
        GL[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Disclamer:
echo If you want to install the Epic Games, GOG Galaxy, Ubisoft Connect, or Origin game launchers then please install Lutris. Then in lutris search for what game launcher you want and click install.
echo Choose your game launcher:

    options=(
    "Steam - Valves digital software delivery system ${GL[1]}"
    "Lutris - Open Gaming Platform ${GL[2]}"
    "Heroic - HGL, a Native alternative Linux Launcher for Epic Games ${GL[3]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Steam - Valves digital software delivery system ${GL[1]}")
                choice 1
                break
                ;;
            "Lutris - Open Gaming Platform ${GL[2]}")
                choice 2
                break
                ;;
            "Heroic - HGL, a Native alternative Linux Launcher for Epic Games ${GL[3]}")
                choice 3
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!GL[@]}"
do
    if [[ ${GL[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

#add if else statments

#games tool choosier

choice () {
    local choice=$1
    if [[ ${GT[choice]} ]] # toggle
    then
        GT[choice]=
    else
        GT[choice]=+
    fi
}

PS3='Please enter your choice: '
while :
do
    clear
echo
echo Choose your cummunications tools:

    options=(
    "MangoHud - A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more. Recemmended ${GT[1]}"
    "Goverlay - A GUI to help manage Vulkan/OpenGL overlays. Recemmended ${GT[2]}"
    "Wine/Winetricks - needed for window games Recemmended ${GT[3]}"
    "Proton - Needed for steam window games ${GT[4]}"
    "ProtonUp - Qt-based graphical user interface to install and manage Proton-GE installations for Steam and Wine-GE installations for Lutris. ${GT[5]}"
    "dxvk - Highly Recemmended!!! Vulkan-based compatibility layer for Direct3D 9/10/11 which allows running 3D applications on Linux using Wine. ${GT[6]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "MangoHud - A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more. Recemmended ${GT[1]}")
                choice 1
                break
                ;;
            "Goverlay - A GUI to help manage Vulkan/OpenGL overlays. Recemmended ${GT[2]}")
                choice 2
                break
                ;;
            "Wine/Winetricks - needed for window games Recemmended  ${GT[3]}")
                choice 3
                break
                ;;
            "Proton - Needed for steam window games  ${GT[4]}")
                choice 4
                break
                ;;
            "ProtonUp - Qt-based graphical user interface to install and manage Proton-GE installations for Steam and Wine-GE installations for Lutris.  ${GT[5]}")
                choice 5
                break
                ;;
            "dxvk - Highly Recemmended!!! Vulkan-based compatibility layer for Direct3D 9/10/11 which allows running 3D applications on Linux using Wine. ${GT[6]}")
                choice 6
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

echo
printf '%s\n' 'Options chosen:'
echo
for opt in "${!GT[@]}"
do
    if [[ ${GT[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done
echo

#add if else statments

echo Installing user choices, please stand by

    #Package Manager

if [ ${PM[1]} ]
then
echo Installing Aura
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg -si
echo
    fi
if [ ${PM[2]} ]
then
echo Installing Discover and syncing latest package repros
sudo aura -S discover packagekit-qt5 --noconfirm
    fi
if [ ${PM[3]} ]
then
sudo aura -A yay-bin --noconfirm
    fi
if [ ${PM[4]} ]
then
sudo aura -A pamac-all --noconfirm
    fi
if [ ${PM[5]} ]
then
sudo aura -A snapd --noconfirm
    fi

    #Desktop Enviorment

if [ ${DE[1]} ]
then
echo Installing Budgie
sudo aura -S budgie-desktop budgie-desktop-view lightdm lightdm-gtk-greeter --noconfirm
    fi
if [ ${DE[2]} ]
then
echo Installing Cinnamon
sudo aura -S xorg cinnamon lightdm lightdm-gtk-greeter --noconfirm
sudo systemctl enable lightdm.service
    fi
if [ ${DE[3]} ]
then
echo installing Gnome
sudo aura -S xorg xorg-server gnome lxdm gnome-tweaks --noconfirm
sudo systemctl enable lxdm.service
    fi
if [ ${DE[4]} ]
then
echo Installing lxqt
sudo aura -S xorg lxqt xdg-utils ttf-freefont sddm libpulse libstatgrab libsysstat lm_sensors network-manager-applet oxygen-icons pavucontrol-qt --noconfirm
sudo systemctl enable sddm
    fi
if [ ${DE[5]} ]
then
echo Installing Mate
sudo aura -S xorg-server mate mate-extra lightdm lightdm-gtk-greeter --noconfirm
sudo systemctl enable lightdm
    fi
if [ ${DE[6]} ]
then
sudo aura -S ark breeze-gtk dbus-python kate kde-gtk-config khotkeys kinfocenter kinit kio-fuse kscreen plasma-desktop plasma-disks plasma-nm plasma-pa powerdevil sddm-kcm --noconfirm
sudo systemctl enable sddm
    fi
if [ ${DE[7]} ]
then
echo Installing xfce4
sudo aura -S xorg xfce4 mousepad parole ristretto thunar-archive-plugin thunar-media-tags-plugin xfce4-battery-plugin xfce4-datetime-plugin xfce4-mount-plugin xfce4-netload-plugin xfce4-notifyd xfce4-pulseaudio-plugin xfce4-screensaver xfce4-taskmanager xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin file-roller network-manager-applet leafpad epdfview galculator lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings capitaine-cursors arc-gtk-theme xdg-user-dirs-gtk --noconfirm
sudo systemctl enable lightdm
    fi

    #Drivers

if [ ${drivers[1]} ]
if [ ${drivers[2]} ]
if [ ${drivers[3]} ]
if [ ${drivers[4]} ]
if [ ${drivers[5]} ]
if [ ${drivers[6]} ]

    #Customization tools

if [ ${CT[1]} ]
if [ ${CT[2]} ]
if [ ${CT[3]} ]

    #bluetooth
if [ ${bluetooth[1]} ]
then
echo Installing bluez bluez-utils blueman pulseaudio-bluetooth
sudo aura -S bluez bluez-utils blueman pulseaudio-bluetooth --noconfirm
echo Enableing and starting bluetooth services
systemctl enable bluetooth.service
systemctl start bluetooth.service
    fi
if [ ${bluetooth[2]} ]
then
echo Not installing bluetooth
    fi

    #Helpful Apps

    #File Manager

    #Text/code

    #Terminal

    #Music Player

    #Web Browser

    #Cummunications Tools

    #Game Launcher

    #Game Tools

#Notes
echo
echo Notes:
echo We hope this script has been helpful and we hope you will use this script again.
echo For reporting issues or want to add suggestions please go to https://gitlab.com/Ako-Ina/arch-script/
echo If you want to chat to me personally you can do so via:
echo My Discord username is Ako-Ina#8410
echo My Revolt username is Ako_Ina
echo
#Final messages
echo For helpful links please see...
echo All application have been installed, the script will now quit.
echo Now type reboot in the terminal and one that happens you should have a usable desktop.
# Exit the script
exit 0
