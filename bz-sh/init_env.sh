## THIS FILE CONTAINS ONLY IMPORTANT EXPORTS
. $HOME/.dotfiles/paths.sh
export LANG="en_US.UTF-8"
[ -n "$DOT_OPTBIN" ] && export PATH="$DOT_OPTBIN:$PATH"
[ -n "$EGET_BIN" ] && export PATH="$EGET_BIN:$PATH"
[ -n "$BINMGR_BIN" ] && export PATH="$BINMGR_BIN:$PATH"
[ -n "${DOT_BREW_HOME}" ] && eval "$($DOT_BREW_HOME/bin/brew shellenv)"
[ -n "${PIXI_HOME}" ] && export PATH="$PIXI_HOME/bin:$PATH"

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
