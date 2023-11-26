#!/bin/bash

KARABINER_CLI="/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"
SYSTEM_PROFILER="/usr/sbin/system_profiler"

# Variable to keep track of the last clamshell status
last_clamshell_status=""

# Function to update Karabiner configuration based on clamshell status
update_karabiner_config() {
    local current_clamshell_status=$1
    # Sleep for 30 seconds on the first run of the function (when last_clamshell_status is empty)
    if [ -z "$last_clamshell_status" ]; then
        sleep 30
    fi

    # Check if the current clamshell status is different from the last status
    if [ "$current_clamshell_status" != "$last_clamshell_status" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - clamshell status changed to $current_clamshell_status. Updating Karabiner configuration..."
        "$KARABINER_CLI" set_variables --set-variables "{\"macbook_clamshell_status\": \"$current_clamshell_status\"}"

        # Update the last clamshell status
        last_clamshell_status=$current_clamshell_status
    fi
}

# Monitor the log stream for clamshell state changes
log stream | while read line; do
  if [[ $line == *"clamshelled: YES"* ]]; then
    update_karabiner_config "closed" # Clamshell closed
  elif [[ $line == *"clamshelled: NO"* ]]; then
    update_karabiner_config "opened" # Clamshell opened
  fi
done
