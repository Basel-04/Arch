

Basics :-

Bluetooth :-
			sudo pacman -S bluez bluez-utils --noconfirm
			sudo systemctl enable bluetooth.service
			sudo systemctl start bluetooth.service

networkm  :-
		    sudo pacman -S networkmanager
			sudo systemctl enable NetworkManager
			sudo systemctl start NetworkManager
			sudo pacman -S network-manager-applet
			
Pipewire  :-
		    sudo pacman -S pipewire pipewire-pulse pipewire-jack pipewire-alsa --noconfirm
			systemctl --user enable pipewire pipewire-pulse
			systemctl --user start pipewire pipewire-pulse
			systemctl --user restart pipewire pipewire-pulse

Fonts     :-
			sudo pacman -S ttf-dejavu ttf-liberation ttf-ubuntu-font-family noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-freefont ttf-opensans ttf-roboto ttf-inconsolata ttf-hack cantarell-fonts ttf-nimbus --noconfirm

Yay		  :-
			sudo pacman -S --needed base-devel git --noconfirm
			git clone https://aur.archlinux.org/yay.git
			cd yay
			makepkg -si --noconfirm
			cd ..
			rm -rf yay

Dependien :-
			sudo pacman -S gtkmm3 jsoncpp libsigc++ fmt wayland chrono-date spdlog gtk3 gobject-introspection libgirepository libpulse libnl libappindicator-gtk3 libdbusmenu-gtk3 libmpdclient libsndio libevdev xkbregistry upower
	
			sudo pacman -S go gtk3 xcur2png gsettings-desktop-schemas

Themes :-

Hyprpaper :- sudo pacman -S hyprland
Hyprpaper :- sudo pacman -S hyprpaper
Hypridle  :- sudo pacman -S hypridle
Hyprlock  :- sudo pacman -S hyprlock
xdg       :- sudo pacman -S xdg-desktop-portal-hyprland
dunst     :- sudo pacman -S dunst




Rofi     :-
	  	    # https://github.com/adi1090x/rofi
	    	sudo pacman -S rofi
		    git clone --depth=1 https://github.com/adi1090x/rofi.git
		    cd rofi
            chmod +x setup.sh
		    ./setup.sh
Waybar   :-
			 # https://github.com/Alexays/Waybar/wiki/Examples
			 git clone https://github.com/Alexays/Waybar
			 cd Waybar
			 meson setup build
			 ninja -C build
			 ./build/waybar
			 If you want to install it
		     ninja -C build install
			 waybar & 
QT5&QT6  :-  # https://github.com/Alexays/Waybar/wiki/Examples
		     # adwaita-qt5 & Dracula Theme & catppuccin
             sudo pacman -S qt5-base qt6-base 
GTK      :-  sudo pacman -Syu nwg-look 
Kvantum  :- sudo pacman -S kvantum
Thunar    :- sudo pacman -S thunar thunar-volman tumbler ffmpegthumbnailer thunar-archive-plugin xarchiver --noconfirm


 sudo pacman -S mousepad nvtop mpv neovim 
 
 yay -S hyprsunset
