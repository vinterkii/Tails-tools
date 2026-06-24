# Tails-tools
A collection of scripts and utilities that I use daily.
---
# Available Tools
## Wallpaper Chooser
A Bash wallpaper changer for TailsOS. It scans a user wallpaper folder on first run, lists all supported image files (PNG/JPG/JPEG/GIF), and prompts you to pick one. Then the script sets the selected image as the desktop wallpaper and the lock-screen wallpaper via `gsettings`. 

You can make it more useful if you add this to your `/live/persistence/TailsData_unlocked/dotfiles/.bashrc` file 
```bash
wall() {
  bash "path/to/this/script.sh"
}
```
and now whenever you run `wall` command in the console it will run the script.
