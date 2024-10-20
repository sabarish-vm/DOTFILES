## THIS FILE CONTAINS ONLY IMPORTANT EXPORTS
. $HOME/.dotfiles/paths.sh
export LANG="en_US.UTF-8"
export PATH="$DOT_OPTBIN:$PATH"
export PATH="$EGET_BIN:$PATH"

devname=$(cat "$HOME/.device_name") &>/dev/null && export DEVICE_NAME="$devname" ||
    {
        printf "%s" "$HOME/.device_name file missing"
        exit
    }

platform="$(uname -s | tr '[:upper:]' '[:lower:]')"

case "${platform}" in
##
msys_nt*) platform="windows" ;;
cygwin_nt*) platform="windows" ;;
mingw*) platform="windows" ;;
linux) platform="linux" ;;
darwin) platform="darwin" ;;
freebsd) platform="freebsd" ;;
##
esac

export PLATFORM="$platform"
