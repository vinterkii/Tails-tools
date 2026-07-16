# Tails-tools
A collection of scripts and utilities that I use daily.

---

# Tools
Bellow is a list of all the tools available in this repo.

## [wall.sh](https://github.com/vinterkii/Tails-tools/blob/main/Scripts/wall.sh)
A Bash wallpaper changer for Gnome. It scans a wallpaper folder By Default `/live/persistence/TailsData_unlocked/dotfiles/Wallpapers`, lists all supported image files (PNG/JPG/JPEG/GIF), and prompts you to pick one. Then the script sets the selected image as the desktop wallpaper and the lock-screen wallpaper via `gsettings`.

after [Installation](https://github.com/vinterkii/Tails-tools#installation) you can use this tool by typing the `wall` command in the terminal. 


# Installation
## Automatic
I have made an installation Script `setup.sh`.

Just clone the repository:
```bash
git clone https://github.com/vinterkii/Tails-tools.git
```

cd into the `Tails-tools` repo:
```bash
cd Tails-tools
```

and run the `setup.sh` Script:
```bash
bash setup.sh
```

now all the tools are installed reopen your terminal and they will be ready to use

## Manual
you can add aliases to your Shell config (e.g. `~/.bashrc` if you're using bash...)

like this
```bash
alias wall='bash /path/to/script/wall.sh'
```
then run `. 'your shell config'` e.g. `. ~/.bashrc` or `source ~/.bashrc` if using bash

TailsOS: mind that if your shell config isn't persistent you'll need to install it every time you restart, if you don't want that enable dotfile in the persistent Storage and copy the shell config into it and restart