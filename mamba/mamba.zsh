#!/usr/bin/env zsh
if command -v micromamba &>/dev/null ; then
    if [ -f "$DOTFILES/mamba/mamba_init_zsh.gen" ] &&
        grep '>>>' "$DOTFILES/mamba/mamba_init_zsh.gen" > /dev/null 2>&1 ; then
            . "$DOTFILES/mamba/mamba_init_zsh.gen"
        else
            if [ -n "$DOT_MAMBA_DIR" ] ; then 
                contents="$(micromamba shell init -s zsh --dry-run $DOT_MAMBA_DIR )"
                line_numbers="$(printf "%s" "$contents" | grep -n -e '>>>' -e '<<<' | cut -f 1 -d ':')"
                l1="$(printf "%s" "$line_numbers" | sed -n 1p )"
                l2="$(printf "%s" "$line_numbers" | sed -n 2p )"
                contents="$(printf "%s" "$contents" | sed -n "${l1}","${l2}"p)"
                printf "%s" "${contents}" > "$DOTFILES/mamba/mamba_init_zsh.gen"
                . "$DOTFILES/mamba/mamba_init_zsh.gen"
            else
                printf "Env variable %s %s" "DOT_MAMBA_DIR" " is not set in $DOTFILES/paths.sh"
            fi
    fi
else
    echo "Micromamba not in path"
fi

