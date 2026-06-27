fzf_recent_path() {
    file="$(zoxide query -l |\
        fzf --reverse --height=100% --border=sharp --wrap --gap\
        --preview 'command eza -D --tree -L 1 --color=always {} || command -p ls -Cp --color=always {}'\
        --info=inline)"
    LBUFFER+=" $file"
    # zle zvm_exit_insert_mode
}
zle -N fzf_recent_path

pet_search_paste() {
    res="$(pet search)"
    LBUFFER="$res"
    zle zvm_exit_insert_mode
    zle zvm_append_eol
}

zle -N pet_search_paste

fuzzy_env() {
        file="$(env | fzf --reverse --height=100% --border=sharp --wrap --gap \
        --info=inline -d= \
        --bind 'ctrl-j:become(echo \${1})'\
        --bind 'ctrl-k:become(echo {2..})'\
        --bind 'enter:best'\
        )"
        LBUFFER+="$file"
}
zle -N fuzzy_env
