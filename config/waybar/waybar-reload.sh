#!/bin/bash
CONFIG_DIR="$HOME/.config/waybar"
CONFIG_FILES=("$CONFIG_DIR/config.jsonc" "$CONFIG_DIR/style.css")

# Fonction pour redémarrer Waybar
restart_waybar() {
  pkill -x waybar
  waybar &
}

# Surveiller les modifications dans les fichiers de configuration
while true; do
  inotifywait -e modify "${CONFIG_FILES[@]}"
  restart_waybar
done

