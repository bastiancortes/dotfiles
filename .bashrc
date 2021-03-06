#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source <(kitty + complete setup bash)

alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim='vimargs'
alias ssh="kitty +kitten ssh"

alias ranger="ranger-fix"

#PS1='[\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\u@\h \w]\\$ \[$(tput sgr0)\]"
export EDITOR=vim
export PATH=$PATH:~/.local/bin

vimargs() {
    #do things with parameters like $1 such as
    (kitty --class vim -e vim $@ & ) > /dev/null 2>&1
}

# startx if on matching VT

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
