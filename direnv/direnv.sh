if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
    export DIRENV_LOG_FORMAT=
fi
