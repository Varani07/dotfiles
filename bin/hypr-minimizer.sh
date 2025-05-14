#!/usr/bin/env bash
# ~/.local/bin/hypr-minimizer
# Usage:
#   hypr-minimizer push       → minimiza a janela ativa (slot automático)
#   hypr-minimizer pop <N>    → restaura a janela do slot N

QUEUE="/tmp/hypr_min_queue"
mkdir -p "$(dirname "$QUEUE")"

action="${1:-}"
slot="${2:-}"

# 1) Captura WID e WS da janela focada via JSON
_info=$(hyprctl activewindow -j)
WID=$(echo "$_info" | jq -r '.address')
WS=$(echo "$_info" | jq -r '.workspace.name')

# 2) Carrega a fila, IGNORANDO linhas vazias
entries=()
if [[ -f "$QUEUE" ]]; then
  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    entries+=("$line")
  done < "$QUEUE"
fi

push() {
  entries+=("${WID}:${WS}")
  printf '%s\n' "${entries[@]}" >"$QUEUE"
  idx=${#entries[@]}
  hyprctl dispatch movetoworkspacesilent "special:slot${idx},address:${WID}"
  echo "→ Minimized WID=${WID} to slot ${idx}"
}

pop() {
  if [[ ! -f "$QUEUE" ]]; then
    echo "✖ No windows minimized" >&2
    exit 1
  fi
  if (( slot<1 || slot> ${#entries[@]} )); then
    echo "✖ Invalid slot: ${slot}" >&2
    exit 1
  fi

  entry=${entries[slot-1]}
  unset 'entries[slot-1]'
  printf '%s\n' "${entries[@]}" >"$QUEUE"

  wid_pop=${entry%%:*}
  ws_pop=${entry#*:}

  hyprctl dispatch movetoworkspace "${ws_pop},address:${wid_pop}"
  hyprctl dispatch focuswindow "address:${wid_pop}"
  echo "← Restored WID=${wid_pop} to WS ${ws_pop}"

  # recompacta os remanescentes em slot1…N-1
  for i in "${!entries[@]}"; do
    id=${entries[i]%%:*}
    hyprctl dispatch movetoworkspacesilent "special:slot$((i+1)),address:${id}"
  done
}

case "$action" in
  push) push ;;
  pop)  pop ;;
  *)
    echo "Usage: $0 {push|pop <slot>}" >&2
    exit 1
    ;;
esac
