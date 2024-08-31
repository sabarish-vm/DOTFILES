## DO NOT CHANGE THE ORDER

welcome_message=''
[[ "$-" == *i* ]] && tty -s && echo "${welcome_message}"
source "$HOME/.dotfiles/bz-sh/init_env.sh"
source "$HOME/.dotfiles/bz-sh/device_initialization.sh"

eval "$(zoxide init zsh)"
source "$DOTFILES/conda/conda.zsh"
source "$DOTFILES/zsh/plugins.zsh"

source "$DOTFILES/zsh/options.zsh"
source "$DOTFILES/bz-sh/aliases.sh" 
source "$DOTFILES/bz-sh/commands.sh" 

source "$DOTFILES/zsh/completions.zsh"

source "$ZSH_PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh"
source "$DOTFILES/zsh/plugins/vi.zsh"
source "$DOTFILES/zsh/autocomplete.zsh"
source "$DOTFILES/zsh/functions.zsh"

export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"
source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

source "$DOTFILES/bz-sh/device_finalization.sh"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/sabarish/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
