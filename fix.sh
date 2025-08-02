#!/bin/bash

echo "[*] Mengatur shell login ke bash untuk kompatibilitas dengan SDDM..."
chsh -s /bin/bash

echo "[*] Menambahkan auto-exec fish di ~/.bashrc jika belum ada..."

FISH_SNIPPET='if [ -z "$DISPLAY" ] || [ "$XDG_VTNR" = 1 ]; then
    exec fish
fi'

if ! grep -Fxq "exec fish" ~/.bashrc; then
    echo "$FISH_SNIPPET" >> ~/.bashrc
    echo "[+] Snippet ditambahkan ke ~/.bashrc"
else
    echo "[=] Sudah ada exec fish di ~/.bashrc, dilewati"
fi

echo "[✓] Selesai. Silakan reboot: sudo reboot"
