#!/bin/bash

set -e

echo "[*] Updating system.."
sudo pacman -Syu --noconfirm

echo "[*] Installing packages.."
sudo pacman -S --noconfirm \
      git \
      firefox \
      pavucontrol \
      ttf-jetbrains-mono-nerd \
      swaybg \
      pipewire-pulse \
      neovim \
      wl-clipboard \
      bluez \
      bluez-utils \
      nodejs \
      npm \
      bind-tools \
      shotcut \
      obs-studio \
      grim \
      swappy \
      rofi \
      wireplumber \
      libgtop \
      networkmanager \
      dart-sass \
      upower \
      gvfs \
      gtksourceview3 \
      libsoup3 \
      swww \
      hyprpicker \
      fastfetch \
      base-devel

echo "[*] Starting Services.."
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "Yay setup."

yay -S linux-wallpaperengine-git debtap
echo "Uncomment # at /etc/pacman.conf for multilib (extended AUR)"

echo "[✔] Setup completed successfully."
