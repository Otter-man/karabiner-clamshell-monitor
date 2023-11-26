
## Clamshell Monitor script and rule for disabling external keyboards for Karabiner Elements

This repository contains complex modification rule for Karabiner Elements, which allows you to disable any external keyboard when your MacBook is opened. 
This feature is particularly useful when you use your MacBook in clamshell mode, i.e., connected to an external display and keyboard/mouse, and wish to prevent the external keyboard from responding once the MacBook is opened, without the need to physically disconnect it.

It depends on a special script, which monitors if your Macbook is closed (clamshelled) and which runs as a background process in your system.

### How It Works

The rule operates on a simple principle: it instructs your Mac to ignore any keystrokes from external keyboards when the internal variable `macbook_clamshell_status` in Karabiner is set to `opened`. Conversely, it disregards this rule when the variable is set to `closed`.

Once you install the script, it will run in the background of your system after every startup and will monitor clamshell status of your Mac via macOS event stream.

On changes detected in the stream it will change the value of the variable, which in turn activates or deactivates the rule.

## Requirements

- MacBook with Apple Silicon
- MacOS Sonoma
- [Karabiner Elements](https://karabiner-elements.pqrs.org/) installed

These modifications haven't been tested with Intel MacBooks or on other versions of macOS.

## Installation Options

### 1. Install Both Clamshell Monitor and Complex Modification rule


Run the following command in your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/install_clamshell_monitor_full.sh)"
```

Open Karabiner Elements __Settings -> Complex Modifications__.  
Click on `+ Add rule`, find `Disable external keyboard input when macbook is opened` rule in the list and click on `+ Enable`.

Restart you MacBook.

### 2. Install Only Clamshell Monitor

(This option will be needed only once the rule is added to Karabiner Elements official Complex Modification site)  
Run the following command in your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/install_clamshell_monitor.sh)"
```
Restart you MacBook.

## Uninstallation

To uninstall all components run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/uninstall_clamshell_monitor.sh)"
```
Open Karabiner Elements __Settings -> Complex Modifications__.  
Find `Disable external keyboard input when macbook is opened` rule in the list and click on trash bin icon to remove it.