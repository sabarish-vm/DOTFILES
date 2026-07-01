## DO NOT CHANGE THE ORDER

welcome_message=''
[[ "$-" == *i* ]] && tty -s && echo "${welcome_message}"
. "$HOME/.dotfiles/paths.sh"
. "$DOTFILES/bz-sh/init_env.sh"
. "$DOTFILES/bz-sh/device_initialization.sh"

. "$DOTFILES/mamba/mamba.zsh"
. "$DOTFILES/zsh/plugins.zsh"

. "$DOTFILES/zsh/options.zsh"
. "$DOTFILES/bz-sh/aliases.sh"
. "$DOTFILES/bz-sh/commands.sh"

. "$DOTFILES/zsh/get_completions.zsh"
. "$ZSH_PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh"
. "$DOTFILES/zsh/plugins/vi.zsh"
. "$DOTFILES/zsh/completions.zsh"
. "$DOTFILES/zsh/functions.zsh"
. "$DOTFILES/zsh/starship/starship.zsh"
. "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

. "$DOTFILES/fnpm/fnm.sh"
. "$DOTFILES/fnpm/pnpm.sh"
. "$DOTFILES/bz-sh/device_finalization.sh"
