#!/usr/bin/env sh

[ -z "$DOTFILES" ] && { export DOTFILES="$HOME/.dotfiles" ; }

link() {
    linkerFile="$1"
    sourceFile="$(cat ${linkerFile} | awk -F '==' '{ printf $1 }')"
    sourceFile="${sourceFile/\$DOTFILES/$DOTFILES}"
    targetFile="$(cat ${linkerFile} | awk -F '==' '{ printf $2 }')"
    targetFile="${targetFile/\$HOME/$HOME}"
    var="ln -s ${sourceFile} ${targetFile}"
    echo "$var"
    eval "$var"
}

link "$DOTFILES/zsh/zsh.linker"
