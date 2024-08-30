## Functions
rawgithub() { echo $1 | sed 's/github/raw.githubusercontent/g' | sed 's#blob\/##g'; }
githubdownload() {
    if [ -n "$2" ]; then
        wget $(echo $1 | sed 's/github/raw.githubusercontent/g' | sed 's#blob\/##g') -O $2
    else
        wget $(echo $1 | sed 's/github/raw.githubusercontent/g' | sed 's#blob\/##g')
    fi
}
bookopen() { fd "$1" $HOME/Books/ | fzf --bind 'enter:become(open {})'; }
gfd() { cd "$(fzf -e --bind 'enter:become(dirname {})')"; }
mat2pyParser() { python -c "from sympy.parsing.mathematica import parse_mathematica;expr=parse_mathematica(""'""${1}""'"") ;print();print(expr)"; }
