case "${DEVICE_NAME}" in

mac) [ -f "$DOTFILES/bz-sh/devices/mac/mac_init.sh" ] &&
    source "$DOTFILES/bz-sh/devices/mac/mac_init.sh" ;;
cast) [ -f "$DOTFILES/bz-sh/devices/cast/cast_init.sh" ] &&
    source "$DOTFILES/bz-sh/devices/cast/cast_init.sh" ;;
hummel) [ -f "$DOTFILES/bz-sh/devices/hummel/hummel_init.sh" ] &&
    source "$DOTFILES/bz-sh/devices/hummel/hummel_init.sh" ;;

esac
