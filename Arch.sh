#!/bin/bash
set -e

# Update system (recommended first step)
sudo pacman -Syu --noconfirm

# Base system components
# ----------------------
# Bluetooth
sudo pacman -S bluez bluez-utils --noconfirm
sudo systemctl enable --now bluetooth.service

# Network
sudo pacman -S networkmanager network-manager-applet --noconfirm
sudo systemctl enable --now NetworkManager

# Audio
sudo pacman -S pipewire pipewire-pulse pipewire-jack pipewire-alsa --noconfirm
systemctl --user enable --now pipewire pipewire-pulse

# Fonts
sudo pacman -S ttf-dejavu ttf-liberation ttf-ubuntu-font-family noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-freefont ttf-opensans ttf-roboto ttf-inconsolata ttf-hack cantarell-fonts ttf-nimbus --noconfirm

# Build essentials and AUR helper
# -------------------------------
sudo pacman -S --needed base-devel git --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# System dependencies
# -------------------
sudo pacman -S gtkmm3 jsoncpp libsigc++ fmt wayland chrono-date spdlog gtk3 gobject-introspection libgirepository libpulse libnl libappindicator-gtk3 libdbusmenu-gtk3 libmpdclient libsndio libevdev xkbregistry upower meson ninja --noconfirm
sudo pacman -S go gtk3 xcur2png gsettings-desktop-schemas --noconfirm

# Hyprland ecosystem
# ------------------
sudo pacman -S hyprland hyprpaper hypridle hyprlock xdg-desktop-portal-hyprland --noconfirm

# GUI components
# --------------
# Notification daemon
sudo pacman -S dunst --noconfirm

# Application launcher
sudo pacman -S rofi --noconfirm
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd ..

# Status bar
git clone https://github.com/Alexays/Waybar
cd Waybar
meson setup build
ninja -C build
sudo ninja -C build install
cd ..

# Theming
# -------
sudo pacman -S qt5-base qt6-base nwg-look kvantum --noconfirm

# File manager
sudo pacman -S thunar thunar-volman tumbler ffmpegthumbnailer thunar-archive-plugin xarchiver --noconfirm

# Additional applications
# -----------------------
sudo pacman -S mousepad nvtop mpv neovim --noconfirm

# AUR packages
# ------------
yay -S hyprsunset --noconfirm

# Final recommendations
echo "Installation complete!"
echo "Recommended actions:"
echo "1. Reboot your system"
echo "2. Configure your Hyprland environment"
echo "3. Copy Waybar/Rofi config files to ~/.config"