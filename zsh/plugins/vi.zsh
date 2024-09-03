source "$ZSH_PLUGINS_DIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
zvm_after_init_commands+=(
'eval "$(fzf --zsh)" ;
source "$DOTFILES/fzf/fzf_config.sh" ; 
source "$DOTFILES/fzf/fzf_config.zsh" ; 
bindkey "^X^F" fzf_recent_path ;
eval "$(zoxide init zsh)"')
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
