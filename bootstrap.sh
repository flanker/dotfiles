#!/bin/bash

cd $HOME

timestamp=`date +"%m%d%H%M%S"`
bak_dir=.dotfiles_bak/$timestamp/
mkdir -p $bak_dir

if [ -f ~/.bash_profile ]; then
  mv ~/.bash_profile $bak_dir
fi
if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig $bak_dir
fi

ln -s ~/Dev/mygithub/dotfiles/bash_profile ~/.bash_profile
ln -s ~/Dev/mygithub/dotfiles/git/gitconfig ~/.gitconfig
