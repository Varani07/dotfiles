#!/usr/bin/env bash

WIN_TITLE="Monitoramento"

Fecha se já estiver aberto
PID=$(pgrep -f "kitty --class $WIN_TITLE")
if [ -n "$PID" ]; then
  pkill -f "kitty --class $WIN_TITLE"
else
    kitty \
    --class "$WIN_TITLE" \
    --title "$WIN_TITLE" \
    --detach \
    -o initial_window_width=50c \
    -o initial_window_height=20c \
    control-panel.sh
fi
