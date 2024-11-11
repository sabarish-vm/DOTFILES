#!/usr/bin/env zsh
if [ -f "$DOTFILES/mamba/mamba_init_zsh.gen" ] &&
    grep '>>>' "$DOTFILES/mamba/mamba_init_zsh.gen" > /dev/null 2>&1 ; then
    . "$DOTFILES/mamba/mamba_init_zsh.gen"
else
    if [ -f "$DOTFILES/mamba/mamba_path.gen" ] ; then 
        mamba_path="$(head "$DOTFILES/mamba/mamba_path.gen" )"
        contents="$(micromamba shell init -s zsh --dry-run $mamba_path)"
        line_numbers="$(printf "%s" "$contents" | grep -n -e '>>>' -e '<<<' | cut -f 1 -d ':')"
        l1="$(printf "%s" "$line_numbers" | sed -n 1p )"
        l2="$(printf "%s" "$line_numbers" | sed -n 2p )"
        contents="$(printf "%s" "$contents" | sed -n "${l1}","${l2}"p)"
        printf "%s" "${contents}" > "$DOTFILES/mamba/mamba_init_zsh.gen"
        . "$DOTFILES/mamba/mamba_init_zsh.gen"
    else
        printf "%s" "mamba path was not setup during DOTFILES installation"
    fi
fi

