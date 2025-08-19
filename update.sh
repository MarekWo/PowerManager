#!/bin/bash

# Simple script to update the Power Manager from the GitHub repository.

# --- CONFIGURATION ---
SCRIPT_URL="https://raw.githubusercontent.com/MarekWo/PowerManager/main/power_manager.sh"
INSTALL_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# --- SCRIPT LOGIC ---
echo "Downloading latest version of the UPS monitor script..."
# Download to a temporary file first
curl -s -L -o "$INSTALL_DIR/power_manager.sh.tmp" "$SCRIPT_URL"

# Check if download was successful and the file is not empty
if [ $? -eq 0 ] && [ -s "$INSTALL_DIR/power_manager.sh.tmp" ]; then
    # Overwrite the old script only if the new one is valid
    mv "$INSTALL_DIR/power_manager.sh.tmp" "$INSTALL_DIR/power_manager.sh"
    chmod +x "$INSTALL_DIR/power_manager.sh"
    echo "Update successful. The script is now executable."
else
    echo "ERROR: Failed to download a valid script. No changes were made."
    # Clean up the failed download
    rm -f "$INSTALL_DIR/power_manager.sh.tmp"
fi