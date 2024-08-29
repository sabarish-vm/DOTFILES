#!/usr/bin/env sh

path="$HOME/opt/cli_manager"
git clone https://github.com/sabarish-vm/cli_manager.git "${path}"

platform="$(uname -s | tr '[:upper:]' '[:lower:]')"
case "${platform}" in
##
linux)
    sh "${path}/eget_essentials.sh"
    ;;
darwin)
    read -n 1 -p 'Do you want to install essentials with brew(b) or eget(e) ? (b/e)' choice
    if [ "${choice}" = "e" -o "$choice" = "E" ]; then
        sh "${path}/eget_essentials.sh"
    elif [ "$choice" = "b" -o "$choice" = "B" ]; then
        sh "${path}/brew_essentials.sh"
    fi
    ;;
##
esac
