#!/bin/bash

# Define URLs for the files
PLIST_URL="https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/assets/com.otterman.karabiner.clamshell_monitor.plist"
SCRIPT_URL="https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/assets/clamshell_monitor.sh"

# Define target directories
LAUNCH_AGENTS_DIR="/Library/LaunchAgents"
USR_BIN="/usr/local/bin"

# Download, move, and set permissions for the monitor script
curl -L $SCRIPT_URL -o "$USR_BIN/clamshell_monitor.sh"
chmod +x "$USR_BIN/clamshell_monitor.sh"

# Download and move the plist file
sudo curl -L $PLIST_URL -o "$LAUNCH_AGENTS_DIR/com.otterman.karabiner.clamshell_monitor.plist"

# Load the plist into the system
launchctl load /Library/LaunchAgents/com.otterman.karabiner.clamshell_monitor.plist

echo "Clamshell Monitor installation complete."