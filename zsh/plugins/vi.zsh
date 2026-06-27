source "$ZSH_PLUGINS_DIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
zvm_after_init_commands+=(
'source <(fzf --zsh) ;
source "$DOTFILES/fzf/fzf_config.sh" ;
source "$DOTFILES/fzf/fzf_config.zsh" ;
bindkey "^X^P" fzf_recent_path ;
bindkey "^X^V" fuzzy_env ;
bindkey "^X^H" pet_search_paste ;
bindkey "^X^[" go_one_level_up ;
bindkey -r "^B" ;
eval "$(zoxide init zsh)"')
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
