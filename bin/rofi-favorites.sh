#!/usr/bin/env bash

FAV="$HOME/.config/rofi/favorites.txt"

# Fecha rofi se já estiver aberto (toggle)
if pgrep -x rofi >/dev/null; then
    pkill -x rofi
    exit
fi

# Verifica leitura
if [[ ! -r "$FAV" ]]; then
    notify-send "Favoritos" "Não é possível ler: $FAV"
    exit 1
fi

# Limpa comentários e linhas vazias, passa para o menu
CHOICE=$(sed -e 's/^\s*//;s/\s*$//' -e '/^#/d' -e '/^$/d' "$FAV" \
         | rofi -dmenu -p "Favoritos:" -config ~/.config/rofi/config.rasi)

# Executa em background
if [[ -n "$CHOICE" ]]; then
    nohup "$CHOICE" >/dev/null 2>&1 &
fi
