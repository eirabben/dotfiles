#!/bin/bash

# Go into the dotfiles directory
cd "$(dirname "${BASH_SOURCE}")";

# Update the repository
git pull origin master;

# Rsync all the files into the home directory
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "install.sh" \
    --exclude "README.md" --exclude "iterm2-colors/" --exclude ".gitignore" \
    --exclude ".aliases" --exclude ".bash_prompt" \
    -avh --no-perms . ~;

# Source the new changes
source ~/.bash_profile;
