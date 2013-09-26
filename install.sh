#!/bin/bash

# Create symlinks, move backups to backup directory
for file in ~/.{bash_profile,bashrc,vimrc,tmux.conf}; do
    if [ -f $file ]; then
         mv "$file" "~/.dotfiles/backup/${file}_backup" 
    fi

    ln -s ~/.dotfiles/$(basename $file) $file
done
unset file

# Copy vim folder to home directory
if [ -d "$HOME/.vim" ] then
    mv $HOME/.vim $HOME/.dotfiles/backup/.vim
fi
cp -r ~/.dotfiles/.vim ~/.vim

# Add vundle to vim folder
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# Install bundles
vim +BundleInstall +qall

