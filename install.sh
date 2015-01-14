#!/bin/bash

# Create symlinks, move backups to backup directory
for file in $HOME/.{bash_profile,bashrc,vimrc,tmux.conf,gitconfig,vim}; do
    if [ -f $file ]; then
         mv "$file" "$HOME/.dotfiles/backup/" 
    fi

    ln -s $HOME/.dotfiles/$(basename $file) $file
done
unset file

# Add vundle to vim folder
if [ ! -d $HOME/.dotfiles/.vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.dotfiles/.vim/bundle/Vundle.vim
fi
# Install bundles
vim +PluginInstall +qall

# Source the changes
source $HOME/.bash_profile
