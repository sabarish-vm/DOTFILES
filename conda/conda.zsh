#!/usr/bin/env bash
if [ -f "$DOTFILES/conda/conda_init_zsh.gen" ] ; then
    source "$DOTFILES/conda/conda_init_zsh.gen"
else 
    if [ -f "$DOTFILES/conda/conda_path.gen" ] ; then 
        conda_bin="$(cat $DOTFILES/conda/conda_path.gen)"
        contents="$($conda_bin init zsh -d -v)"
        line_numbers="$(echo $contents | grep -n -e '>>>' -e '<<<' | cut -f 1 -d ':')"
        l1="$(echo $line_numbers | sed -n 1p )"
        l2="$(echo $line_numbers | sed -n 2p )"
        echo "${line_numbers}"
        contents="$(echo $contents | sed -n ${l1},${l2}p | cut -c 2-)"
        echo "${contents}" > "$DOTFILES/conda/conda_init.zsh"
        source "$DOTFILES/conda/conda_init.zsh"
    else 
        echo "Conda path was not setup during DOTFILES installation"
    fi
fi

