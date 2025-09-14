eval "$(/opt/homebrew/bin/brew shellenv)"
source "$DOTFILES/bz-sh/devices/mac/mac_paths.sh"
[ -f "$DOTFILES/bz-sh/devices/mac/mac_init.prv.sh" ] &&
    source "$DOTFILES/bz-sh/devices/mac/mac_init.prv.sh"

alias texocr='PATH="/Users/sabarish/opt/micromamba/envs/latexocr/bin/:$PATH" latexocr'
