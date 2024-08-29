case "${DEVICE_NAME}" in

mac) [ -f "$DOTFILES/bz-sh/devices/mac_init.sh" ] && source "$DOTFILES/bz-sh/devices/mac_init.sh" ;;
cast) [ -f "$DOTFILES/bz-sh/devices/cast_init.sh" ] && source "$DOTFILES/bz-sh/devices/cast_init.sh" ;;
hummel) [ -f "$DOTFILES/bz-sh/devices/hummel_init.sh" ] && source "$DOTFILES/bz-sh/devices/hummel_init.sh" ;;

esac
