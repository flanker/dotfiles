#!/bin/bash

cd $HOME

timestamp=`date +"%m%d%H%M%S"`
bak_dir=.dotfiles_bak/$timestamp/
mkdir -p $bak_dir

mv .bash_profile $bak_dir
mv .gitconfig $bak_dir

ln -s ~/Dev/mygithub/dotfiles/bash_profile ~/.bash_profile
ln -s ~/Dev/mygithub/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/Dev/mygithub/dotfiles/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
