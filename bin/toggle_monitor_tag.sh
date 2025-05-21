#!/usr/bin/env bash
#
# toggle_monitor_pin.sh
# Alterna o pin/unpin da janela cujo título for exatamente "Monitoramento".

# 1) Captura JSON dos clientes
clients=$(hyprctl -j clients 2>/dev/null) || {
  echo "Erro: não foi possível obter lista de janelas" >&2
  exit 1
}

# 2) Extrai o address da janela de título "Monitoramento"
address=$(jq -r '
  .[] 
  | select(.title == "Monitoramento") 
  | .address
' <<< "$clients")

if [ -z "$address" ]; then
  echo "Janela 'Monitoramento' não encontrada." >&2
  exit 1
fi

# 3) Usa o dispatcher "pin" para alternar o estado de pinned
#    (se não estiver fixada ele fixa, se já estiver fixa ele desfaz)
hyprctl dispatch pin address:"$address"
