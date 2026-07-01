if [ -f "$DOTFILES/fnpm/pnpm_home.gen" ]; then
    . "$DOTFILES/fnpm/pnpm_home.gen"
else
    if command -v pnpm &>/dev/null; then
        PNPM_HOME="$(pnpm store path | grep -E -o '^.*?pnpm')"
        if [ -d "$PNPM_HOME" ]; then
            printf "%s\n" "export PNPM_HOME=${PNPM_HOME}" >"$DOTFILES/fnpm/pnpm_home.gen"
            printf 'export PATH=$PNPM_HOME:$PATH\n' >>"$DOTFILES/fnpm/pnpm_home.gen"
        else
            printf "%s" "pnpm found, but path extraction failed"
        fi
    else
        printf "%s" "pnpm not found, use fnm's corepack to initialize it"
    fi
fi
