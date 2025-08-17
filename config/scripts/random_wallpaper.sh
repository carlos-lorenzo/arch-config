#!/usr/bin/env bash

CURRENT_WALL=$(cat ~/.cache/current_wallpaper)
NEW_WALL=$(find ~/images/wallpapers/ -type f | shuf -n 1)

HYPR_DIR=~/.config/hypr/hyprpaper.conf


echo '' > $(echo $HYPR_DIR)

echo "preload=$NEW_WALL" >> $(echo $HYPR_DIR)

for MONITOR_ID in $(hyprctl monitors | grep Monitor | awk '{print $2}'); do
    echo "wallpaper=$MONITOR_ID,$NEW_WALL" >> $(echo $HYPR_DIR)
done

echo "splash=false" >> $(echo $HYPR_DIR)


cp -rf $NEW_WALL ~/.cache/current_wallpaper

killall hyprpaper 
hyprpaper &>/dev/null & disown