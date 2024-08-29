case "${DEVICE_NAME}" in

mac) source "$DOTFILES/bz-sh/devices/mac_init.sh" ;;
cast) cast_init ;;
hummel) hummel_init ;;

esac
