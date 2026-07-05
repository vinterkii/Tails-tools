#!/bin/bash
# this is a script that turns the scripts in 'Scripts' into bash/zsh commands

# ANSI Color & Style
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

BOLD='\x1B[1m'
ITALIC='\x1B[3m'

RESET='\033[0m\x1B[0m'

DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# get the config file for the shell
case $SHELL in 
    */bash)  SHELL_CONFIG="${HOME}/.bashrc" ;;
    */zsh)  SHELL_CONFIG='$HOME/.zshrc' ;;
    */fish)  SHELL_CONFIG='$HOME/.config/fish/config.fish' ;;
    */dash)   SHELL_CONFIG='$HOME/.profile' ;;
    *) 
        echo -e "${RED} Sorry Your Shell is not supported yet..." 
        echo -e "$Please Use (Bash, Zsh, Fish or dash)${RESET}" 
        read -pr "Press Any Key..." dump
        exit ;;
esac

install() {
    local date
    date="$(date '+%Y-%m-%d')"

    # Backups the Shell Config (e.g. .bashrc ...)
    mkdir -p "$HOME/Backup/Shell_Config"
    cat "$SHELL_CONFIG" >> "$HOME/Backup/Shell_Config/${SHELL##/*/}_${date}_Backup.txt"
    echo -e "${YELLOW}Your '${SHELL_CONFIG}' Have been backuped in to '$HOME/Backup/Shell_Config/${SHELL##/*/}_${date}_Backup.txt' ${RESET}"

    cat >> "$SHELL_CONFIG" <<EOF
# Tails-tools setup MlVkT0a3
alias wall="bash ${DIR}/Scripts/wall.sh"

# End Of Tails-tools (PS: Don't Add any thing inside it will be replaced when reinstalling)

EOF

  echo -e "${GREEN}Done${RESET}"
}


reinstall() {
    echo "WIP"
    refresh
    exit
}

refresh() {
    case "$SHELL" in
        */bash) source ${HOME}/.bashrc ;;
        */zsh) source $HOME/.zshrc ;;
        */fish) source $HOME/.config/fish/config.fish ;;
        */dash)  . $HOME/.profile ;;
        *) echo -e "${RED} Sorry Your Shell is not supported yet... Please Use (Bash, Zsh, Fish or dash)${RESET}" ;;
    esac
    exit
}

# Check if the setup has run before
if grep -q "# Tails-tools setup MlVkT0a3" $SHELL_CONFIG ; then
    echo -e "The Script Has been Setup Before..."
    echo ""
    read -p "Would You want to reinstall? (y/n):" ACTION
    case "$ACTION" in
        y|Y|yes)
            reinstall ;;
        n|N|no|"")
            echo -e "Reinstall Canceled..."
            echo -e "if you're Having Problems running the commands try restartig your terminal"
            refresh ;;
    esac
else
    echo -e "The script will modify your ${SHELL_CONFIG}"
    read -rp "..." dump
    echo -e "The script will add these aliases:"
    echo "${ORANGE}wall ${GRAY}# This is the Wallpaper Changer for Gnome"
    # add more aliases as you add more scripts  
    
    read -p "Are You Sure You Want To Continue? (y/n):" ACTION
    case "$ACTION" in 
        y|Y|yes) install ;;
        n|N|No|*) exit ;;
    esac
fi