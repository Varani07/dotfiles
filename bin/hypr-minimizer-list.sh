#!/usr/bin/env bash
# ~/.local/bin/hypr-minimizer-list
# Toggle a lista de janelas minimizadas; se o menu já estiver aberto, fecha ele

QUEUE="/tmp/hypr_min_queue"
PROMPT="Minimized windows"

# Se um rofi dessa instância já estiver rodando, mata e sai
if pgrep -f "rofi.*-p $PROMPT" >/dev/null; then
  pkill -f "rofi.*-p $PROMPT"
  exit 0
fi

# Carrega o estado JSON de todas as janelas
state=$(hyprctl -j clients)

# Monta a lista de itens (slot: título)
entries=()
if [[ -f "$QUEUE" ]]; then
  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    wid=${line%%:*}
    title=$(echo "$state" \
      | jq -r --arg w "$wid" '.[] | select(.address==$w) | (.title // .class)')
    [[ -z "$title" ]] && title="(no title)"
    entries+=("$(( ${#entries[@]}+1 )): $title")
  done < "$QUEUE"
fi

# Se não houver nada minimizar, sai
(( ${#entries[@]} )) || exit 0

# Exibe o menu e captura seleção
selection=$(printf '%s
' "${entries[@]}" \
  | rofi -dmenu -i -p "$PROMPT")

# Se saiu sem escolher, apenas encerra
[[ -z "$selection" ]] && exit 0

# Pega o número do slot escolhido e executa o pop
slot=${selection%%:*}
/home/varani/.local/bin/hypr-minimizer pop "$slot"
