#!/usr/bin/env bash

CURRENT_WALL_CACHE=$HOME/.cache/current_wallpaper
HYPR_DIR=$HOME/.config/hypr/hyprpaper.conf

# Check if the current wallpaper exists
if [[ -f $CURRENT_WALL_CACHE && -s $CURRENT_WALL_CACHE ]]; then
    CURRENT_WALL=$(cat $CURRENT_WALL_CACHE)
else
    # If no current wallpaper exists, set a random one
    CURRENT_WALL=$(find $HOME/images/wallpapers/ -type f | shuf -n 1)
    echo $CURRENT_WALL > $CURRENT_WALL_CACHE
fi

# Select a new random wallpaper
NEW_WALL=$(find $HOME/images/wallpapers/ -type f | shuf -n 1)

# Clear the hyprpaper configuration file
echo '' > $HYPR_DIR

# Preload the new wallpaper
echo "preload=$NEW_WALL" >> $HYPR_DIR

# Set the wallpaper for each monitor
for MONITOR_ID in $(hyprctl monitors | grep Monitor | awk '{print $2}'); do
    echo "wallpaper=$MONITOR_ID,$NEW_WALL" >> $HYPR_DIR
done

# Disable splash
echo "splash=false" >> $HYPR_DIR

# Update the current wallpaper cache
echo $NEW_WALL > $CURRENT_WALL_CACHE

# Restart hyprpaper
killall hyprpaper 
hyprpaper &>/dev/null &