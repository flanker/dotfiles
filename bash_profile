alias ls="ls -AGFh"
alias ll="ls -l"
alias grep='grep --color'

alias hi='cd ~/Dev/REA/home-ideas'
alias rea='cd ~/Dev/REA'
alias hit='cd ~/Dev/REA/home-ideas-team'
alias dev='cd ~/Dev'


alias http_proxy='export http_proxy="http://gw01.dev.int.realestate.com.au:8080/"'
alias be='bundle exec'
alias mysqlstart='sudo /usr/local/mysql/bin/mysqld_safe --user=mysql'
alias mysqlstop='/usr/local/mysql/bin/mysqladmin -u root -p shutdown'
alias tomcatstart='/usr/local/tomcat/bin/startup.sh'
alias tomcatstop='/usr/local/tomcat/bin/shutdown.sh'

PS1="\[\033[36m\]\u\[\033[33m\]@\[\033[33m\]\h:\[\033[35m\]\W\[\033[m\]\$ "

source ~/.dotfiles/bash/git-completion.bash
source ~/.dotfiles/bash/proxy.bash

# bash history commands
export HISTCONTROL=erasedups
export HISTSIZE=1000
shopt -s histappend

export EDITOR=vim

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function'

ccd () {
  command cd "$@";
  if [ -f ./buildfile ]; then
    echo "test"
    complete -W "$(be buildr -T | awk 'NR != 1 {print $2}')" rake
  else
    complete -r rake
  fi
}
