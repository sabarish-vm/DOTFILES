# History options
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST # Delete oldest duplicate commands first when history fills up
setopt HIST_IGNORE_DUPS       # Do not write a command to history if it matches the previous one
setopt HIST_IGNORE_SPACE      # Ignore commands starting with a space (great for hiding passwords)
setopt HIST_REDUCE_BLANKS     # Remove extra wide spaces from commands before saving
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

# Other options
unsetopt beep
setopt extendedglob
