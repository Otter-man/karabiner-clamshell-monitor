
### Clamshell Monitor Setup for Karabiner Elements

This repository contains complex modification rule for Karabiner Elements, which allows you to disable external keyboards if your Macbook is opened.  
It requires a special script, which monitors if your Macbook is closed (clamshelled) and which runs as a background process in your system.

## Requirements

- MacBook with Apple Silicon
- MacOS Sonoma
- [Karabiner Elements](https://karabiner-elements.pqrs.org/) installed

This modifications haven't been tested with Intel MacBooks or on other versions of macOS.

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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/install_clamshell_monitor_only.sh)"
```
Restart you MacBook.

## Uninstallation

To uninstall all components run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Otter-man/karabiner-clamshell-monitor/main/uninstall_all_clamshell_monitor.sh)"
```
