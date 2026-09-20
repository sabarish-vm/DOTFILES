[ -n "$ZSH_PLUGINS_DIR" ] && : || { echo "Create the paths.sh from the template" ; }

if [ -d "$ZSH_PLUGINS_DIR" ] ; then
    tmpfile="$ZSH_PLUGINS_DIR/.installed_plugins"
    if grep -q "zvim" "$tmpfile" && grep -q "zfzf" "$tmpfile" && grep -q "zshighlight" "$tmpfile" ; then
      :
    else
      echo "One of the zsh plugins not installed"
    fi
else :
    echo "ZSH_PLUGINS_DIR=$ZSH_PLUGINS_DIR is missing. Do you want create and download the plugins ? (y/n)"
    read -r choice
    if [ "$choice" = "y" -o "$choice" = "Y" ]; then
        mkdir -p "$ZSH_PLUGINS_DIR"
        cd "$ZSH_PLUGINS_DIR"
        touch ".installed_plugins"
        git clone https://github.com/jeffreytse/zsh-vi-mode.git
        echo "zvim" >> ".installed_plugins"
        git clone https://github.com/Aloxaf/fzf-tab.git
        echo "zfzf" >> ".installed_plugins"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
        echo "zshighlight" >> ".installed_plugins"
    fi
fi

