#!/usr/bin/env sh

path="$HOME/opt/cli_manager"
git clone https://github.com/sabarish-vm/cli_manager.git "${path}"

platform="$(uname -s | tr '[:upper:]' '[:lower:]')"
case "${platform}" in
##
linux) platform="linux" ;;
darwin) platform="mac" ;;
##
esac

export PLATFORM="$platform"

sh "${path}/${platform}_essentials.sh"
