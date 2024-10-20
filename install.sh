#!/usr/bin/env sh

[ -f "$DOTFILES/paths.sh" ] && . "$DOTFILES/paths.sh" || {
    echo "Setup paths.sh file"
    exit
}
mkdir -p "$DOT_OPT"
mkdir -p "$DOT_OPTBIN"
mkdir -p "$EGET_BIN"
mkdir -p "$ZSH_PLUGINS_DIR"

link() {
    linkerFile="$1"
    sourceFile="$(head "${linkerFile}" | awk -F '==' '{ printf $1 }')"
    sourceFile="$(echo "$sourceFile" | sed "s#\$DOTFILES#$DOTFILES#g")"
    targetFile="$(head "${linkerFile}" | awk -F '==' '{ printf $2 }')"
    targetFile="$(echo "$targetFile" | sed "s#\$HOME#$HOME#g")"
    if [ -f "$targetFile" ]; then
        echo "Target file ($targetFile) exists. Do you want to remove and replace it ? (y/N)"
        read -r choice
        if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
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
    conda_ins
    cli_manager_ins
    zsh_ins
}

linker() {
    if [ "$1" = "a" ] || [ "$1" = "A" ] || [ "$1" = "all" ] || [ "$1" = "ALL" ]; then
        local var="$(find . -name "*linker" -print0 | tr '\0' '\n')"
        for i in $var; do
            link "$i"
        done
    else
        local var="$(find . -name "*${1}*linker" -print0 | tr '\0' '\n')"
        for i in $var; do
            link "$i"
        done
    fi
}

help() {
    echo "--conda        Setup conda init files and condarc"
    echo "--cli_manager  Setup a cli_manager directory"
    echo "--zsh          Setup zsh rc"
    echo "--all          Setup all the above in the same order as above"
    echo "--link <ARG>   Setup the links for <ARG>."
    echo "               Use a or all for setting up all links"
    echo "               Use the module name in place of <ARG> to setup that particular one"
    echo "               e.g. --link zsh to setup the zshrc link"
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
    --link)
        tolink="$2"
        linker "$tolink"
        shift 2
        ;;
    -h | --help)
        help
        shift 1
        ;;
    *)
        exit 1
        ;;
    esac
done
