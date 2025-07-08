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
      neovim \
      wl-clipboard \
      kdenlive \
      bluez \
      bluez-utils \
      nodejs \
      npm

echo "[*] Starting Services.."
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

echo "[*] Installing neovim configurations.."
if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/itselijahwood/init.lua.git ~/.config/nvim
  mv ~/.config/init.lua ~/.config/nvim
  echo "[*] Neovim setup successfully"
else
  echo "[!] Directory $HOME/.config/nvim already exists, Skipping."
fi

echo "[✔] Setup completed successfully."
