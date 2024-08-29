case "${DEVICE_NAME}" in

mac) [ -f "$DOTFILES/bz-sh/devices/mac_final.sh" ] && source "$DOTFILES/bz-sh/devices/mac_final.sh" ;;
cast*) [ -f "$DOTFILES/bz-sh/devices/cast_final.sh" ] && source "$DOTFILES/bz-sh/devices/cast_final.sh" ;;
hummel*) [ -f "$DOTFILES/bz-sh/devices/hummel_final.sh" ] && source "$DOTFILES/bz-sh/devices/hummel_final.sh" ;;
esac
