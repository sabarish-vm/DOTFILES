export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$(grep -e '^[^#]' $DOTFILES/fzf/fzf_ctrl_T_opts |
    tr '\n' ' ')"
