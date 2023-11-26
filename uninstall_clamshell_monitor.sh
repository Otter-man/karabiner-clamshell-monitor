#!/bin/bash

# Define target directories
LAUNCH_AGENTS_DIR="/Library/LaunchAgents"
USR_BIN="/usr/local/bin"
COMPLEX_MODIFICATIONS_DIR="$HOME/.config/karabiner/assets/complex_modifications"

# Check if the plist is loaded and unload it if necessary
if launchctl list | grep -q "com.otterman.karabiner.clamshell_monitor"; then
    launchctl unload /Library/LaunchAgents/com.otterman.karabiner.clamshell_monitor.plist
fi

# Remove the plist file
[ -f "$LAUNCH_AGENTS_DIR/com.otterman.karabiner.clamshell_monitor.plist" ] && sudo rm -f "$LAUNCH_AGENTS_DIR/com.otterman.karabiner.clamshell_monitor.plist"

# Remove the shell script
[ -f "$USR_BIN/clamshell_monitor.sh" ] && rm -f "$USR_BIN/clamshell_monitor.sh"

# Remove the complex modification file
[ -f "$COMPLEX_MODIFICATIONS_DIR/macbook_disable_external_keyboard_on_open.json" ] && rm -f "$COMPLEX_MODIFICATIONS_DIR/macbook_disable_external_keyboard_on_open.json"

echo "All components of the Clamshell Monitor have been uninstalled."
