#!/bin/bash

if pgrep -f "kitty --class Letra" > /dev/null; then
    pkill -f "kitty --class Letra"
else
    sleep 0.3  # evita bug de corrida
    kitty --class Letra --title Letra ~/.local/bin/lyrics.sh
fi
