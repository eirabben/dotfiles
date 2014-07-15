#!/bin/sh

# Pull changes from github
git pull origin master

# Pull updates from vundle
cd ~/.vim/bundle/vundle
git pull

# Install bundles
vim +BundleInstall +qall

source $HOME/.bash_profile
