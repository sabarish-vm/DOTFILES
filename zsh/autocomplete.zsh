fpath=($DOTFILES/zsh/completions $fpath)

autoload -U compinit; compinit
_comp_options+=(globdots)   # With hidden files
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST

# # Define completers
zstyle ':completion:*' list-prompt   ''
zstyle ':completion:*' select-prompt ''
zstyle ':completion:*' completer _extensions _complete _approximate _list
zstyle ':completion:*' menu interactive
zstyle ':completion:*' complete-options true
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:*:*:descriptions' format '[%d]'
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*:*:z:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

