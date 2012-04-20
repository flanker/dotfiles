#!/bin/bash

# use vi mode
# set -o vi

PS1="\[\033[36m\]\u\[\033[33m\]@\[\033[35m\]\W\[\033[m\]\$ "

PATH=/usr/local/bin:/usr/local/mongodb/bin:$PATH

# load all bash files
for f in ~/Dev/mygithub/dotfiles/bash/*.bash
do
  source $f
done

# bash history commands
export HISTCONTROL=erasedups
export HISTSIZE=1000
shopt -s histappend

export EDITOR=vim

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

ccd () {
  command cd "$@";
  if [ -f ./buildfile ]; then
    echo "test"
    complete -W "$(be buildr -T | awk 'NR != 1 {print $2}')" rake
  else
    complete -r rake
  fi
}
