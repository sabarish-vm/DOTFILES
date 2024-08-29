export LANG="en_US.UTF-8"
export DOTFILES="$HOME/.dotfiles"
export PATH="$HOME/opt/bin/:$PATH"

devname=$(cat "$HOME/.device_name") &>/dev/null  && export DEVICE_NAME="$devname" || {printf "%s" "$HOME/.device_name file missing" ;
    exec zsh -l -f ; 
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
