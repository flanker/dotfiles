#!/bin/bash

cd $HOME

timestamp=`date +"%m%d%H%M%S"`
bak_dir=.dotfiles_bak/$timestamp/
mkdir -p $bak_dir

mv ~/.bash_profile $bak_dir
mv ~/.gitconfig $bak_dir
mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User $bak_dir

ln -s ~/Dev/mygithub/dotfiles/bash_profile ~/.bash_profile
ln -s ~/Dev/mygithub/dotfiles/git/gitconfig ~/.gitconfig
mkdir ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/Dev/mygithub/dotfiles/sublime/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
