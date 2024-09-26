############################ cd to z
#alias cd='__zoxide_cd' #Not a great idea do not do this
#if needed use (zoxide init zsh --cmd cd) to replace z with cd and zi with cdi

#################################### ls to eza
eza_params=(
    '--git' '--icons' '--group' '--group-directories-first'
    '--time-style=long-iso' '--color-scale=all'
)

alias ls='eza $eza_params'
alias la='eza $eza_params -a'
alias lsd='eza -D $eza_params '
alias la1='eza $eza_params -a -1'
alias lal='eza $eza_params --all --long'
alias laa='eza -lbhHigUmuSa'
alias ll='eza --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias lt='eza $eza_params -stype'
alias tree='eza --tree $eza_params'

alias lsg='eza --git-ignore $eza_params'
alias lx='eza -lbhHigUmuSa@'

####################################
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

####################################
##Run a different zshrc file equivalent --rcfile flag of bash
#alias vzsh='(ZDOTDIR=$HOME/.myshell/zsh_vanilla zsh -i -d)'

####################################
alias curconv='currency_converter'

####################################
alias cl='clear'
alias gst='git status'
alias br='broot'
alias lg='lazygit'

#################################### HPC stuff
alias me="[[  0 != \$(squeue --me | tail -n +2 | wc -l) ]] && paste -d '         ' <(jobqueue) <( echo 'WorkDir'; jobqueue | tail -n +2 | awk '{print \$1}' | xargs -n 1 scontrol show job | rg 'WorkDir=(.*)' -or '\$1' | xargs realpath ) || echo 'No running jobs'"
alias jobcancelz="(me) | tail -n +2 |fzf -m | awk '{print \$1}' | xargs -r -n 1 scancel"
alias jobcd='cd $((me) | tail -n +2 |fzf | awk '\''{print $6}'\'')'
alias jobdata='(me) | tail -n +2 |fzf -m | awk '\''{printf("%s""/data"),$6}'\'' | xargs -r -n 1 ls'
