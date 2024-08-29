#!/usr/bin/env bash
if [ -f "$DOTFILES/conda/conda_init_gen.zsh" ] ; then
    source "$DOTFILES/conda/conda_init_gen.zsh"
else 
    conda_bin="$(sh $DOTFILES/conda/conda_path.sh)"
    contents="$($conda_bin init zsh -d -v)"
    line_numbers="$(echo $contents | grep -n -e '>>>' -e '<<<' | cut -f 1 -d ':')"
    l1="$(echo $line_numbers | sed -n 1p )"
    l2="$(echo $line_numbers | sed -n 2p )"
    echo "${line_numbers}"
    contents="$(echo $contents | sed -n ${l1},${l2}p | cut -c 2-)"
    echo "${contents}" > "$DOTFILES/conda/conda_init.zsh"
    source "$DOTFILES/conda/conda_init.zsh"
fi

