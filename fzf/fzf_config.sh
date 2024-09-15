export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$(grep -e '^[^#]' $DOTFILES/fzf/fzf_ctrl_T_opts |
    tr '\n' ' ')"

_fzf_comprun() {
    local command=$1
    shift
    rootdir="$(echo "$@" | sed 's#.*walker-root=\(.*\)#\1#g')"
    case "$command" in
    cd | z)
        fd -t d '.' "$dir" | fzf --prompt 'D> ' \
            --bind 'ctrl-h:transform:[[ ! $FZF_PROMPT =~ H ]] &&
        echo "change-prompt(HD> )+reload(fd -t d --hidden . $dir)" ||
        echo "change-prompt(D> )+reload(fd -t d . $dir)"' \
            --preview \
            'eza --tree -L 1 --icons --group-directories-first --color=always {}'
        ;;
    *)
        fd -t f '.' "$dir" | fzf --prompt 'F> ' \
            --bind 'ctrl-f:transform:[[ ! $FZF_PROMPT =~ F ]] &&
            echo "change-prompt(F> )+reload(fd --type file)" ||
            echo "change-prompt(D> )+reload(fd --type directory)"' \
            --bind 'ctrl-h:transform:[[ ! $FZF_PROMPT =~ HF ]] && 
            echo "change-prompt(HF> )+reload(fd --type file --hidden)" ||
            echo "change-prompt(HD> )+reload(fd --type directory --hidden)"' \
            --preview '[[ $FZF_PROMPT =~ "HF|F" ]] &&
            bat --color=always {} ||
            eza --tree -L 1 --icons --color=always  {}'
        ;;
    esac
}
