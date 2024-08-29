#!/usr/bin/env sh

source $HOME/.dotfiles/paths.sh
[ -z "$DOTFILES" ] && { export DOTFILES="$HOME/.dotfiles" ; }

source $DOTFILES/cli_tools/setup.sh

condaexe=$(echo "$condaexe" | tr -d '[:space:]')
[ -n "${condaexe}" ] && { echo "${condaexe}" > $DOTFILES/conda/conda_path.gen ; }

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
