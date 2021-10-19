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
txtrst='\[\e[0m\]'    # Text Reset

GIT_BRANCH="\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/<\1>/')"
PS1="${txtcyn}\u${txtylw}@${txtpur}\W${txtred}${GIT_BRANCH}${txtrst}\$ "

PATH=/usr/local/sbin:/usr/local/bin:/usr/local/mongodb/bin:$PATH

# load all bash files
for f in ~/Dev/mygithub/dotfiles/bash/*.bash
do
  source $f
done

# bash history commands
export HISTCONTROL=erasedups
export HISTSIZE=100000
shopt -s histappend

export EDITOR=vim

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export JAVA_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
export GRADLE_OPTS="-Xmx2048m -Xms1024m -XX:MaxPermSize=2048m"

ulimit -S -n 1024
