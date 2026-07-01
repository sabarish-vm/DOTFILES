if command -v fnm &>/dev/null; then
    eval "$(fnm env)"
elif [ -f "$DOT_FNM/bin/fnpm" ]; then
    eval "$($DOT_FNM/bin/fnpm env)"
else
    echo "fnm not found on path"
fi
