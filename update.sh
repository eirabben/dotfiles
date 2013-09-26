#!/bin/sh

# Pull changes from github
git pull origin master

# Pull updates from vundle
cd ~/.vim/bundle/vundle
git pull

source ~/.bashrc
