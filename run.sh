#!/bin/bash

set -e

echo "[*] Updating system.."
sudo pacman -Syu --noconfirm

echo "[*] Installing packages.."
sudo pacman -S --noconfirm \
      git \
      firefox \
      waybar \
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
      steam \

echo "[*] Starting Services.."
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

echo "[*] Installing neovim configurations.."

git clone https://github.com/itselijahwood/init.lua.git ~/.config/nvim
mv ~/.config/init.lua ~/.config/nvim

echo "[*] Neovim setup successfully"
echo "If steam does not install, uncomment # at /etc/pacman.conf for multilib"
echo "Make sure to also manually install ProtonVPN from flatpak"

echo "[✔] Setup completed successfully."
