fzf_recent_path() {
    file=$(rtt)
    LBUFFER+="$file"
}
zle -N fzf_recent_path
