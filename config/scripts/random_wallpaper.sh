#!/usr/bin/env bash

# Ensure hyprpaper is running
if ! pgrep -x "hyprpaper" > /dev/null; then
    hyprpaper &
    sleep 0.5 # Give it a moment to initialize the socket
fi

WALLPAPER_DIR="$HOME/images/wallpapers"
NEW_WALL=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# 1. Preload the new image into memory
hyprctl hyprpaper preload "$NEW_WALL"

# 2. Get all active monitors and apply the wallpaper
# Using -j (JSON) with jq is the most robust way to parse Hyprland output
monitors=$(hyprctl monitors -j | jq -r '.[] | .name')

for mon in $monitors; do
    # Syntax: hyprctl hyprpaper wallpaper "monitor,path"
    hyprctl hyprpaper wallpaper "$mon,$NEW_WALL"
done

# 3. (Optional) Unload the previous wallpaper to save RAM
# This keeps only the current wallpaper in the buffer
hyprctl hyprpaper unload all