#!/usr/bin/env bash
# filepath: /home/carlos/dev/arch-config/update_config.sh

# Define the repository and target directory
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

if [ -d "$CONFIG_DIR" ]; then
    BACKUP_DIR="$CONFIG_DIR-backup-$(date +%Y%m%d%H%M%S)"
    echo "Backing up existing config to $BACKUP_DIR..."
    cp -r "$CONFIG_DIR" "$BACKUP_DIR"
fi



# Pull the latest changes from the repository
echo "Pulling the latest changes from the repository..."
cd "$REPO_DIR" || exit
git pull origin main

# Sync the contents of the config directory
echo "Syncing the repository's config directory with ~/.config..."
rsync -avh --progress "$REPO_DIR/config/" "$CONFIG_DIR/"

if [ $(brightnessctl m) -eq 1 ]; then
    # Set desktop version of waybar config
    cat config/waybar/desktop_config.jsonc > ~/.config/waybar/config.jsonc
    cat config/waybar/desktop_style.css > ~/.config/waybar/style.css
fi

cp "$REPO_DIR/Extras/starship.toml" "$CONFIG_DIR/"

echo "Update complete!"