#!/bin/bash

# use vi mode
# set -o vi

# from https://wiki.archlinux.org/index.php/Color_Bash_Prompt
txtblk='\[\e[0;30m\]' # Black
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White

GIT_BRANCH=$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/<\1>/')
PS1="${txtcyn}\u${txtylw}@${txtpur}\W${txtred}${GIT_BRANCH}${txtrst}\$ "

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
