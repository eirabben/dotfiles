#!/bin/bash

# Go into the dotfiles directory
cd "$(dirname "${BASH_SOURCE}")";

# Update the repository
git pull origin master;

# Rsync all the files into the home directory
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "install.sh" \
    --exclude "README.md" --exclude "iterm2-colors/" --exclude ".gitignore" \
    -avh --no-perms . ~;

# Source the new changes
source ~/.bash_profile;

# Install Vundle and all configured plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
