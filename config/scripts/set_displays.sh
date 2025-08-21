#!/usr/bin/env bash

# Path to the Hyprland configuration file
HYPRLAND_CONFIG="$HOME/.config/hypr/hyprland.conf"

# Get monitor IDs
MONITOR_IDS="$(hyprctl monitors | grep Monitor | awk '{print $2}')"

# Loop through each monitor
for MONITOR_ID in $MONITOR_IDS; do
    # Get available modes for the current monitor
    MODES=$(hyprctl monitors | grep -A 20 "$MONITOR_ID" | grep "availableModes:" | sed 's/availableModes: //')

    # Split modes into lines and sort by resolution and refresh rate
    BEST_MODE=$(echo "$MODES" | tr ' ' '\n' | \
        awk -F'[x@]' '{print $1, $2, $3, $0}' | \
        sort -k1,1nr -k2,2nr -k3,3nr | \
        awk '{print $4}' | head -n 1)

    # Construct the configuration statement
    CONFIG_STATEMENT="monitor=$MONITOR_ID,$BEST_MODE,auto,1"

    # Check if the monitor already has a configuration line in the Hyprland config
    if grep -q "^monitor=$MONITOR_ID," "$HYPRLAND_CONFIG"; then
        # Replace the existing line with the new configuration
        sed -i "s|^monitor=$MONITOR_ID,.*|$CONFIG_STATEMENT|" "$HYPRLAND_CONFIG"
    else
        # Append the new configuration line if it doesn't exist
        echo "$CONFIG_STATEMENT" >> "$HYPRLAND_CONFIG"
    fi
done
hyprctl reload