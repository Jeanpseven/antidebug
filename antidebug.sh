#!/bin/bash

v_decrypt() {
  # Simula descriptografia
  echo "$1"
}

URL="http://pastebin.com/raw/xxxxxx"
RESPONSE=$(curl -s "$URL" | sed 's/&quot;/"/g')

# Extrai conteúdo entre "start" e "end"
EXTRACTED=$(echo "$RESPONSE" | sed -n 's/.*start\(.*\)end.*/\1/p' | xargs)

# Verifica se 'jq' está instalado
if ! command -v jq >/dev/null 2>&1; then
  echo "Erro: jq não está instalado."
  exit 1
fi

# Faz o parsing e descriptografa
HOST=$(echo "$EXTRACTED" | jq -r '.host')
ADDRESS=$(v_decrypt "$HOST" | xargs)

echo "Endereço: $ADDRESS"
