#!/bin/bash

# Add vundle to vim folder
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# Install bundles
vim +BundleInstall +qall

# Copy vim folder to home directory
cp -r ~/.dotfiles/.vim ~/.vim

# Create symlinks, move backups to backup directory
for file in ~/.{bash_profile,bashrc,vimrc,tmux.conf}; do
    if [ -f $file ]; then
         mv "$file" "~/.dotfiles/backup/${file}_backup" 
    fi

    ln -s ~/.dotfiles/$(basename $file) $file
done
unset file

