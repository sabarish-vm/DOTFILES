[ -d "$DOTFILES/zsh/completions" ] && : || mkdir -p "$DOTFILES/zsh/completions"

if [ -f "$DOTFILES/zsh/completions/_zellij" ] ; then
    :
else
    zellij setup --generate-completion zsh > "$DOTFILES/zsh/completions/_zellij"
fi

if [ -f "$DOTFILES/zsh/completions/_eza" ] ; then 
    :
else 
    gitget https://github.com/eza-community/eza/blob/main/completions/zsh/_eza $DOTFILES/zsh/completions/_eza
fi

