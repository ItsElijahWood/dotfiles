#!/bin/bash

set -e

echo "[*] Updating system.."
sudo pacman -Syu --noconfirm

echo "[*] Installing packages.."
sudo pacman -S --noconfirm \
      waybar \
      pavucontrol \
      ttf-jetbrains-mono-nerd \
      fastfetch \
      swaybg \
      neovim \
      wl-clipboard \
      kdenlive \
      bluez \
      bluez-utils

echo "[*] Cloning yay AUR helper.."
if [ ! -d "$HOME/yay" ]; then
  git clone https://aur.archlinux.org/yay.git ~
  echo "[*] yay cloned successfully"
else 
  echo "[!] Directory $HOME/yay already exists, Skipping."
fi

echo "[*] Installing neovim configurations.."
if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/itselijahwood/init.lua.git ~/.config
  mv ~/.config/init.lua ~/.config/nvim
  echo "[*] Neovim setup successfully"
else
  echo "[!] Directory $HOME/.config/nvim already exists, Skipping."
fi

echo "[✔] Setup completed successfully."
