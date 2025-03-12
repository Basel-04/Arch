#!/bin/bash

# Function to install Bluetooth
install_bluetooth() {
    echo "Installing Bluetooth..."
    sudo pacman -S bluez bluez-utils --noconfirm
    sudo systemctl enable bluetooth.service
    sudo systemctl start bluetooth.service
    echo "Bluetooth installed and enabled."
}

# Function to install Network Manager
install_network_manager() {
    echo "Installing Network Manager..."
    sudo pacman -S networkmanager network-manager-applet --noconfirm
    sudo systemctl enable NetworkManager
    sudo systemctl start NetworkManager
    echo "Network Manager installed and enabled."
}

# Function to install Pipewire
install_pipewire() {
    echo "Installing Pipewire..."
    sudo pacman -S pipewire pipewire-pulse pipewire-jack pipewire-alsa --noconfirm
    systemctl --user enable pipewire pipewire-pulse
    systemctl --user start pipewire pipewire-pulse
    systemctl --user restart pipewire pipewire-pulse
    echo "Pipewire installed and configured."
}

# Function to install Fonts
install_fonts() {
    echo "Installing fonts..."
    sudo pacman -S ttf-ubuntu-font-family ttf-dejavu ttf-liberation noto-fonts gnu-free-fonts ttf-droid cantarell-fonts noto-fonts-emoji gsfonts ttf-roboto --noconfirm
    echo "Fonts installed."
}

# Function to install Yay (AUR helper)
install_yay() {
    echo "Installing Yay..."
    sudo pacman -S --needed base-devel git --noconfirm
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
    echo "Yay installed."
}

# Function to install dependencies
install_dependencies() {
    echo "Installing system dependencies..."
    sudo pacman -S gtkmm3 jsoncpp libsigc++ fmt wayland chrono-date spdlog gtk3 gobject-introspection libgirepository libpulse libnl libappindicator-gtk3 libdbusmenu-gtk3 libmpdclient libsndio libevdev xkbregistry upower go gtk3 xcur2png gsettings-desktop-schemas --noconfirm
    echo "System dependencies installed."
}

# Function to install Hyprland and related packages
install_hyprland() {
    echo "Installing Hyprland and related packages..."
    sudo pacman -S hyprland hyprpaper hypridle hyprlock xdg-desktop-portal-hyprland --noconfirm
    echo "Hyprland and related packages installed."
}

# Function to install Dunst
install_dunst() {
    echo "Installing Dunst..."
    sudo pacman -S dunst --noconfirm
    echo "Dunst installed."
}

# Function to install Rofi
install_rofi() {
    echo "Installing Rofi..."
    sudo pacman -S rofi --noconfirm
    git clone --depth=1 https://github.com/adi1090x/rofi.git
    cd rofi
    chmod +x setup.sh
    ./setup.sh
    cd ..
    rm -rf rofi
    echo "Rofi installed."
}

# Function to install Waybar
install_waybar() {
    echo "Installing Waybar..."
    git clone https://github.com/Alexays/Waybar
    cd Waybar
    meson setup build
    ninja -C build
    ./build/waybar
    ninja -C build install
    waybar &
    cd ..
    rm -rf Waybar
    echo "Waybar installed."
}

# Function to install QT5 and QT6
install_qt() {
    echo "Installing QT5 and QT6..."
    sudo pacman -S qt5-base qt6-base --noconfirm
    echo "QT5 and QT6 installed."
}

# Function to install GTK themes
install_gtk() {
    echo "Installing GTK themes..."
    sudo pacman -S nwg-look --noconfirm
    echo "GTK themes installed."
}

# Function to install Kvantum
install_kvantum() {
    echo "Installing Kvantum..."
    sudo pacman -S kvantum --noconfirm
    echo "Kvantum installed."
}

# Function to install Thunar and related packages
install_thunar() {
    echo "Installing Thunar..."
    sudo pacman -S thunar thunar-volman tumbler ffmpegthumbnailer thunar-archive-plugin xarchiver --noconfirm
    echo "Thunar installed."
}

# Function to install additional applications
install_additional_apps() {
    echo "Installing additional applications..."
    sudo pacman -S mousepad nvtop mpv neovim --noconfirm
    yay -S hyprsunset --noconfirm
    echo "Additional applications installed."
}

# Main script execution
echo "Starting installation process..."

install_bluetooth
install_network_manager
install_pipewire
install_fonts
install_yay
install_dependencies
install_hyprland
install_dunst
install_rofi
install_waybar
install_qt
install_gtk
install_kvantum
install_thunar
install_additional_apps

echo "Installation complete!"
