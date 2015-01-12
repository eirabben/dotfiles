#!/bin/sh

# Pull changes from github
git pull origin master

# Pull updates from vundle
cd ~/.vim/bundle/vundle
git pull

# Install bundles
vim +PluginInstall +qall

source $HOME/.bash_profile
