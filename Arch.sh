#!/bin/bash

# Basics: Bluetooth
sudo pacman -S bluez bluez-utils --noconfirm
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Basics: Network Manager
sudo pacman -S networkmanager --noconfirm
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
sudo pacman -S network-manager-applet --noconfirm

# Basics: Pipewire
sudo pacman -S pipewire pipewire-pulse pipewire-jack pipewire-alsa --noconfirm
systemctl --user enable pipewire pipewire-pulse
systemctl --user start pipewire pipewire-pulse
systemctl --user restart pipewire pipewire-pulse

# Basics: Fonts
sudo pacman -S ttf-dejavu ttf-liberation ttf-ubuntu-font-family noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
ttf-freefont ttf-opensans ttf-roboto ttf-inconsolata ttf-hack cantarell-fonts ttf-nimbus --noconfirm

# Yay - AUR Helper
sudo pacman -S --needed base-devel git --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Dependencies
sudo pacman -S gtkmm3 jsoncpp libsigc++ fmt wayland chrono-date spdlog gtk3 gobject-introspection libgirepository libpulse \
libnl libappindicator-gtk3 libdbusmenu-gtk3 libmpdclient libsndio libevdev xkbregistry upower --noconfirm
sudo pacman -S go gtk3 xcur2png gsettings-desktop-schemas --noconfirm

# Themes
sudo pacman -S hyprland hyprpaper hypridle hyprlock xdg-desktop-portal-hyprland dunst --noconfirm

# Rofi
sudo pacman -S rofi --noconfirm
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd ..

# Waybar
git clone https://github.com/Alexays/Waybar.git
cd Waybar
meson setup build
ninja -C build
./build/waybar
# Optional Install
ninja -C build install
cd ..

# QT5 & QT6
sudo pacman -S qt5-base qt6-base --noconfirm

# GTK
sudo pacman -Syu nwg-look --noconfirm

# Kvantum
sudo pacman -S kvantum --noconfirm

# Thunar (File Manager)
sudo pacman -S thunar thunar-volman tumbler ffmpegthumbnailer thunar-archive-plugin xarchiver --noconfirm

# Additional Tools
sudo pacman -S mousepad nvtop mpv neovim --noconfirm

# Hyprsunset
yay -S hyprsunset --noconfirm
