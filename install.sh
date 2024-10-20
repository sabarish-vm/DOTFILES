#!/usr/bin/env sh

[ -z "$DOTFILES" ] && { export DOTFILES="$HOME/.dotfiles"; }
. "$DOTFILES/paths.sh"
mkdir -p "$egetbin"

link() {
    linkerFile="$1"
    sourceFile="$(head "${linkerFile}" | awk -F '==' '{ printf $1 }')"
    sourceFile="$(echo "$sourceFile" | sed "s#\$DOTFILES#$DOTFILES#g")"
    targetFile="$(head "${linkerFile}" | awk -F '==' '{ printf $2 }')"
    targetFile="$(echo "$targetFile" | sed "s#\$HOME#$HOME#g")"
    if [ -f "$targetFile" ]; then
        echo "Target file ($targetFile) exists. Do you want to remove and replace it ? (y/N)"
        read -r choice
        if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
            rm "$targetFile"
        fi
    fi
    var="ln -s ${sourceFile} ${targetFile}"
    echo "$var"
    eval "$var"
}

cli_manager_ins() {
    . "$DOTFILES/cli_tools/setup.sh"
}

conda_ins() {
    condaexe=$(echo "$condaexe" | tr -d '[:space:]')
    [ -f "${condaexe}" ] &&
        { echo "${condaexe}" >"$DOTFILES/conda/conda_path.gen"; } ||
        { echo "Conda path does not exist condaexe=${condaexe}"; }
}

zsh_ins() {
    link "$DOTFILES/zsh/zsh.linker"
}

all() {
    cli_manager_ins
    conda_ins
    zsh_ins
}
while [ "$#" -gt 0 ]; do
    case "$1" in
    --conda)
        conda_ins
        shift 1
        ;;
    --cli_manager)
        cli_manager_ins
        shift 1
        ;;
    --zsh)
        zsh_ins
        shift 1
        ;;
    --all)
        all
        exit 0
        ;;
    *)
        exit 1
        ;;
    esac
done
