#!/bin/bash

# Define URLs for the files
PLIST_URL="https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/assets/com.otterman.karabiner.clamshell_monitor.plist"
SCRIPT_URL="https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/assets/clamshell_monitor.sh"
MODIFICATION_URL="https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/assets/macbook_disable_external_keyboard_on_open.json"

# Define target directories
LAUNCH_AGENTS_DIR="/Library/LaunchAgents"
USR_BIN="/usr/local/bin"
COMPLEX_MODIFICATIONS_DIR="$HOME/.config/karabiner/assets/complex_modifications"

# Download, move, and set permissions for the monitor script
curl -L $SCRIPT_URL -o "$USR_BIN/clamshell_monitor.sh"
chmod +x "$USR_BIN/clamshell_monitor.sh"

# Download and move the complex modification file
curl -L $MODIFICATION_URL -o "$COMPLEX_MODIFICATIONS_DIR/macbook_disable_external_keyboard_on_open.json"

# Download and move the plist file
sudo curl -L $PLIST_URL -o "$LAUNCH_AGENTS_DIR/com.otterman.karabiner.clamshell_monitor.plist"

# Load the plist into the system
launchctl load /Library/LaunchAgents/com.otterman.karabiner.clamshell_monitor.plist

echo "Clamshell Monitor and Complex Modification installation complete."