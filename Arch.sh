#!/bin/bash
set -e

# 1. Update system and install essential tools FIRST
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git --noconfirm  # <-- Git moved here

# 2. System Services
# ------------------
# Bluetooth
sudo pacman -S bluez bluez-utils --noconfirm
sudo systemctl enable --now bluetooth.service

# Network
sudo pacman -S networkmanager network-manager-applet --noconfirm
sudo systemctl enable --now NetworkManager

# 3. Audio Subsystem
sudo pacman -S pipewire pipewire-pulse pipewire-jack pipewire-alsa --noconfirm
systemctl --user enable --now pipewire pipewire-pulse

# 4. Fonts
sudo pacman -S ttf-dejavu ttf-liberation ttf-ubuntu-font-family noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-freefont ttf-opensans ttf-roboto ttf-inconsolata ttf-hack cantarell-fonts ttf-nimbus --noconfirm

# 5. Install Yay (AUR Helper)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# 6. Fix Dependency Issues
# ------------------------
# Corrected package names:
sudo pacman -S gtkmm3 jsoncpp libsigc++ fmt wayland boost-libs spdlog gtk3 gobject-introspection libgirepository libpulse libnl libappindicator-gtk3 libdbusmenu-gtk3 libmpdclient libsndio libevdev xkbregistry upower meson ninja --noconfirm
sudo pacman -S go gtk3 xcur2png gsettings-desktop-schemas --noconfirm

# 7. Hyprland Ecosystem
sudo pacman -S hyprland hyprpaper hypridle hyprlock xdg-desktop-portal-hyprland --noconfirm

# 8. GUI Components
sudo pacman -S dunst rofi --noconfirm

# Rofi Setup
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd ..

# Waybar (with explicit dependencies)
sudo pacman -S cmake wayland-protocols --noconfirm  # <-- Added missing deps
git clone https://github.com/Alexays/Waybar
cd Waybar
meson setup build
ninja -C build
sudo ninja -C build install
cd ..

# 9. Theming
sudo pacman -S qt5-base qt6-base nwg-look kvantum --noconfirm

# 10. File Manager
sudo pacman -S thunar thunar-volman tumbler ffmpegthumbnailer thunar-archive-plugin xarchiver --noconfirm

# 11. Utilities
sudo pacman -S mousepad nvtop mpv neovim --noconfirm

# 12. AUR Packages
yay -S hyprsunset --noconfirm

echo "Installation completed successfully!"
echo "Reboot and configure your Hyprland setup."
