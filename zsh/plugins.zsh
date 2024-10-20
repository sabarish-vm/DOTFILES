[ -n "$ZSH_PLUGINS_DIR" ] && : || { echo "Create the paths.sh from the template" ; }

if [ -d "$ZSH_PLUGINS_DIR" ] ; then 
    :
else :
    echo "ZSH_PLUGINS_DIR=$ZSH_PLUGINS_DIR is missing. Do you want create and download the plugins ? (y/n)"
    read -r choice
    if [ "$choice" = "y" -o "$choice" = "Y" ]; then
        mkdir -p "$ZSH_PLUGINS_DIR"
        cd "$ZSH_PLUGINS_DIR"
        git clone https://github.com/jeffreytse/zsh-vi-mode.git
        git clone https://github.com/Aloxaf/fzf-tab.git
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    fi
fi
