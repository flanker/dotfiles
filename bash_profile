# alias for commands
alias ls="ls -AGFh"
alias ll="ls -l"
alias grep='grep --color'
alias m="mvim ."
alias be='bundle exec'

# alias for file and directory
alias dev='cd ~/Dev'

# alias for commands
alias mysqlstart='sudo /usr/local/mysql/bin/mysqld_safe --user=mysql'
alias mysqlstop='/usr/local/mysql/bin/mysqladmin -u root -p shutdown'
alias tomcatstart='/usr/local/tomcat/bin/startup.sh'
alias tomcatstop='/usr/local/tomcat/bin/shutdown.sh'

# use vi mode
set -o vi

PS1="\[\033[36m\]\u\[\033[33m\]@\[\033[35m\]\W\[\033[m\]\$ "

PATH=/usr/local/bin:$PATH

# load all bash files
for f in ~/.dotfiles/bash/*.bash
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
