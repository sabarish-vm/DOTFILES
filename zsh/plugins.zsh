export ZSH_PLUGINS_DIR="$HOME/.zsh_plugins/"

if [ -d "$ZSH_PLUGINS_DIR" ] ; then 
    :
else :
    mkdir -p "$ZSH_PLUGINS_DIR"
    cd "$ZSH_PLUGINS_DIR"
    git clone https://github.com/jeffreytse/zsh-vi-mode.git
    git clone https://github.com/Aloxaf/fzf-tab.git 
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
fi
