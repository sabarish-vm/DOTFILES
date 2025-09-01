eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/bin:$PATH"
[ -f "$DOTFILES/bz-sh/devices/mac/mac_init.prv.sh" ] &&
    source "$DOTFILES/bz-sh/devices/mac/mac_init.prv.sh"

alias texocr='PATH="/Users/sabarish/opt/micromamba/envs/latexocr/bin/:$PATH" latexocr'
alias sowcal='gcalcli --calendar Work'
alias mecal='gcalcli --calendar Sabarish'
