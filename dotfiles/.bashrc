[[ $- != *i* ]] && return

DEFAULT="\e[39m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"

alias ls="ls --color"

PS1="\[$YELLOW\][\[$GREEN\]\u\[$DEFAULT\]@\[$RED\]\h\[$DEFAULT\] \W\[$YELLOW\]]\[$DEFAULT\]\$ "
