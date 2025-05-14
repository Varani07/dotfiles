#!/bin/bash

APP="ncspot"

# Detecta artista e música atual
title=$(playerctl -p "$APP" metadata title 2>/dev/null)
artist=$(playerctl -p "$APP" metadata artist 2>/dev/null)

if [[ -z "$title" || -z "$artist" ]]; then
    echo "[ERRO] Nenhuma música tocando."
    exit 1
fi

# Monta a URL para a API lyrics.ovh (sem tempo, mas confiável)
response=$(curl -s "https://api.lyrics.ovh/v1/${artist// /%20}/${title// /%20}")

# Extrai letra
lyrics=$(echo "$response" | jq -r '.lyrics')

if [[ "$lyrics" == "null" || -z "$lyrics" ]]; then
    echo "[ERRO] Letra não encontrada para: $artist - $title"
    exit 1
fi

# Exibe a letra paginada
echo -e "🎵 $artist - $title 🎵\n\n$lyrics" | less
