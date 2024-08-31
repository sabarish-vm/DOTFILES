#!/usr/bin/env sh
if [ -f "$DOTFILES/conda/conda_init_zsh.gen" ] &&
    grep '>>> conda init' "$DOTFILES/conda/conda_init_zsh.gen" > /dev/null 2>&1 ; then
    . "$DOTFILES/conda/conda_init_zsh.gen"
else 
    if [ -f "$DOTFILES/conda/conda_path.gen" ] ; then 
        conda_bin="$(head "$DOTFILES/conda/conda_path.gen" )"
        contents="$("$conda_bin" init zsh -d -v)"
        line_numbers="$(echo "$contents" | grep -n -e '>>>' -e '<<<' | cut -f 1 -d ':')"
        l1="$(echo "$line_numbers" | sed -n 1p )"
        l2="$(echo "$line_numbers" | sed -n 2p )"
        contents="$(echo "$contents" | sed -n "${l1}","${l2}"p | cut -c 2-)"
        echo "${contents}" > "$DOTFILES/conda/conda_init_zsh.gen"
        . "$DOTFILES/conda/conda_init_zsh.gen"
    else
        echo "Conda path was not setup during DOTFILES installation"
    fi
fi

