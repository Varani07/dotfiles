#!/usr/bin/env bash
# Fecha o Rofi se já estiver aberto
if pgrep -x rofi > /dev/null; then
    pkill -x rofi
    exit
fi

# Executa o drun para listar apps instalados
exec rofi -show drun \
     -config ~/.config/rofi/config.rasi
