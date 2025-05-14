#!/bin/bash

APP_NAME="ncspot"
TMP_IMG="/tmp/ncspot_capa.jpg"
LOG_FILE="/tmp/capa.log"

log() {
    echo "[$(date '+%H:%M:%S')] $1" >> "$LOG_FILE"
}

log "Script iniciado"

ULTIMA_URL=""

playerctl -p "$APP_NAME" metadata --follow | while read -r _; do
    status=$(playerctl -p "$APP_NAME" status 2>/dev/null)

    if [[ "$status" != "Playing" ]]; then
        log "Música pausada/parada"
        continue
    fi

    url=$(playerctl -p "$APP_NAME" metadata mpris:artUrl 2>/dev/null)

    if [[ "$url" == "$ULTIMA_URL" ]]; then
        continue
    fi

    ULTIMA_URL="$url"

    if [[ "$url" == http* ]]; then
        curl -s -L "$url" -o "$TMP_IMG"
        if [[ -s "$TMP_IMG" ]]; then
            log "Nova capa baixada"
        else
            log "Falha ao baixar a imagem"
        fi
    fi
done
