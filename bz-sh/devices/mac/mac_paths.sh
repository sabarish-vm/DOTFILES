paths="
/opt/homebrew/bin
$HOME/.cargo/bin
"

stacked="$($DOTFILES/bz-sh/path_gen ${paths})"
export PATH="$stacked$PATH"
