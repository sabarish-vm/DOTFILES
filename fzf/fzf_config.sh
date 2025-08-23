export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$(grep -e '^[^#]' $DOTFILES/fzf/fzf_ctrl_T_opts |
    tr '\n' ' ')"

_fzf_comprun() {
    local command=$1
    shift
    dir="$(echo "$@" | sed 's#.*walker-root=\(.*\)#\1#g')"
    case "$command" in

    ssh)
        $DOTFILES/fzf/_fzf_ssh | fzf --preview 'awk -v var={} "{
        slicedStr=substr(var,1,length(var)-1); pattern=\"^Host \" slicedStr \".*$\" ;if(match(\$0,pattern)) { inside=\"1\";print;next }
        if(inside) {
                if(match(\$0,/^Host [A-Za-z0-9]/)) {inside=\"\";next}
                else {print;next}
        }
        }" $HOME/.ssh/config'
        ;;

    cd | z | mkdir)
        fd -t d '.' "$dir" | fzf --prompt 'D>L2' \
            --bind "ctrl-h:transform:[[ ! \$FZF_PROMPT =~ H ]] &&
        echo 'change-prompt(HD>L2)+reload(fd -t d --hidden . $dir)' ||
        echo 'change-prompt(D>L2)+reload(fd -t d . $dir)'" \
            --bind "ctrl-i:transform:[[ ! \$FZF_PROMPT =~ U ]] &&
        echo 'change-prompt(UD>L2)+reload(fd -t d --unrestricted . $dir)' ||
        echo 'change-prompt(D>L2)+reload(fd -t d . $dir)'" \
            --bind "shift-up:transform:$HOME/.dotfiles/fzf/fzf_level \$FZF_PROMPT up $dir" \
            --bind "shift-down:transform:$HOME/.dotfiles/fzf/fzf_level \$FZF_PROMPT down $dir" \
            --preview \
            'eza --tree -L 1 --icons --group-directories-first --color=always {}'
        ;;

    *)
        fd -t f '.' "$dir" | fzf --prompt 'F>L2 ' \
            --bind "ctrl-f:transform:[[ ! \$FZF_PROMPT =~ F ]] &&
            echo 'change-prompt(F>L2 )+reload(fd --type file . $dir)' ||
            echo 'change-prompt(D>L2 )+reload(fd --type directory . $dir)'" \
            --bind "ctrl-h:transform:[[ ! \$FZF_PROMPT =~ HF ]] && 
            echo 'change-prompt(HF>L2 )+reload(fd --type file --hidden . $dir)' ||
            echo 'change-prompt(HD>L2 )+reload(fd --type directory --hidden . $dir)'" \
            --bind "ctrl-o:transform:[[ ! \$FZF_PROMPT =~ UF ]] && 
            echo 'change-prompt(UF>L2 )+reload(fd --type file --unrestricted . $dir)' ||
            echo 'change-prompt(UD>L2 )+reload(fd --type directory --unrestricted . $dir)'" \
            --bind "shift-up:transform:$HOME/.dotfiles/fzf/fzf_level \$FZF_PROMPT up $dir" \
            --bind "shift-down:transform:$HOME/.dotfiles/fzf/fzf_level \$FZF_PROMPT down $dir" \
            --preview '[[ $FZF_PROMPT =~ "HF|UF|F" ]] &&
            bat --color=always {} ||
            eza --tree -L 1 --icons --color=always  {}'
        ;;
    esac
}
