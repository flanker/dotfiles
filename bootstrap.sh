#!/bin/bash

cd $HOME

timestamp=`date +"%m%d%H%M%S"`
bak_dir=.dotfiles_bak/$timestamp/
mkdir -p $bak_dir

mv .bash_profile $bak_dir
mv .gitconfig $bak_dir

ln -s .dotfiles/bash_profile .bash_profile
ln -s .dotfiles/git/gitconfig .gitconfig
