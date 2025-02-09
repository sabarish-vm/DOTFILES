## Functions
gitget() {
    if [ -n "$2" ]; then
        wget $(echo $1 | sed 's/github/raw.githubusercontent/g' | sed 's#blob\/##g') -O $2
    else
        wget $(echo $1 | sed 's/github/raw.githubusercontent/g' | sed 's#blob\/##g')
    fi
}
bookopen() { fd "$1" $HOME/Books/ | fzf --bind 'enter:become(open {})'; }
gfd() { cd "$(fzf -e --bind 'enter:become(dirname {})')"; }
mat2py() {
    python -c "from sympy.parsing.mathematica import parse_mathematica;expr=parse_mathematica(""'""${1}""'"") ;print();print(expr)"
}

###########################################################################################

zja() {
    var=$(zellij ls | cut -c 8- | cut -d " " -f 1 | rev | cut -c 4- | rev | fzf)
    [[ -n "$var" ]] && zellij a $var
}
zjd() {
    var=$(zellij ls | cut -c 8- | cut -d " " -f 1 | rev | cut -c 4- | rev | fzf)
    [[ -n "$var" ]] && zellij d $var
}
zjk() {
    var=$(zellij ls | cut -c 8- | cut -d " " -f 1 | rev | cut -c 4- | rev | fzf)
    [[ -n "$var" ]] && zellij k $var
}

zjviu() { zellij run -- viu "$1" -w 80; }
###########################################################################################

makeit() {
    cwd="$(pwd)"
    cd "$1"
    make clean
    make -j
    cd "$cwd"
}
