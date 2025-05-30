## DO NOT CHANGE THE ORDER

welcome_message=''
[[ "$-" == *i* ]] && tty -s && echo "${welcome_message}"
source "$HOME/.dotfiles/bz-sh/init_env.sh"
source "$HOME/.dotfiles/bz-sh/device_initialization.sh"

source "$DOTFILES/mamba/mamba.zsh"
source "$DOTFILES/zsh/plugins.zsh"

source "$DOTFILES/zsh/options.zsh"
source "$DOTFILES/bz-sh/aliases.sh" 
source "$DOTFILES/bz-sh/commands.sh" 

source "$DOTFILES/zsh/get_completions.zsh"

source "$ZSH_PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh"
source "$DOTFILES/zsh/plugins/vi.zsh"
source "$DOTFILES/zsh/completions.zsh"
source "$DOTFILES/zsh/functions.zsh"

export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"
source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

source "$DOTFILES/bz-sh/device_finalization.sh"
