#!/bin/bash

set -e

echo "[+] Memasang ZSH dan dependensi..."
sudo pacman -Syu --noconfirm zsh git curl wget

echo "[+] Mengatur ZSH untuk $(whoami)..."

export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

sed -i 's/^plugins=.*/plugins=(git sudo)/' ~/.zshrc

chsh -s /bin/zsh

echo "[+] Mengatur ZSH untuk root..."
sudo cp -r ~/.oh-my-zsh /root/
sudo cp ~/.zshrc /root/
sudo chsh -s /bin/zsh root

echo "[+] Instalasi selesai. Restart terminalmu atau login ulang."
