fzf_recent_path() {
    file="$(zoxide query -l |\
        fzf --reverse --height=100% --border=sharp --wrap --gap\
        --preview 'command eza -D --tree -L 1 --color=always {} || command -p ls -Cp --color=always {}'\
        --info=inline)"
    LBUFFER+=" $file"
    # zle zvm_exit_insert_mode
}
zle -N fzf_recent_path
