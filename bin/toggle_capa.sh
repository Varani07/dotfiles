#!/bin/bash

IMG="/tmp/ncspot_capa.jpg"
PID_FILE="/tmp/swayimg_toggle_pid"

# Se já estiver visível, fecha
if [[ -f "$PID_FILE" ]]; then
    kill -9 "$(cat "$PID_FILE")" 2>/dev/null
    rm -f "$PID_FILE"
    notify-send "Capa escondida"
else
    if [[ -s "$IMG" ]]; then
        swayimg --size=300,300 --position=50,50 "$IMG" &
        echo $! > "$PID_FILE"
        notify-send "Capa exibida"
    else
        notify-send "Sem capa para exibir"
    fi
fi
