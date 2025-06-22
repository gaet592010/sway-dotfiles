#!/bin/bash

# Surveiller les événements de hotplug des écrans
CONFIG_FILE="$HOME/.config/waybar/config.jsonc"
buffer=""

udevadm monitor --subsystem-match=drm --property | while IFS= read -r line || [[ -n $line ]]; do
  if [[ -z "$line" ]]; then
    # Fin d'un événement, analyse le buffer
    if echo "$buffer" | grep -q 'DEVTYPE=drm_connector'; then
      if echo "$buffer" | grep -q 'ACTION=add\|ACTION=remove'; then
        output=$(kscreen-doctor --json | jq -r '.outputs[] | select(.priority == 1) | .name')
        echo "Événement détecté (add ou remove), mise à jour avec output : $output"
        sed -i -E 's/("output"[[:space:]]*:[[:space:]]*")[^"]*(")/\1'"$output"'\2/' "$CONFIG_FILE"
        echo "Config mise à jour"
      fi
    fi
    buffer=""
  else
    buffer+="$line"$'\n'
  fi
done

