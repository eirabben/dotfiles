#!/bin/bash

# TODO: Copy color schemes for terminals, vim and tmux
# TODO: Make update mode for bootstrap.sh

# Add vundle to vim folder
#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Copy vim color scheme to vim folder
#cp ~/.dotfiles/vim/base16-railscasts.vim ~/.vim/colors/

# Create symlinks
for file in ~/.{bash_profile,bashrc,vimrc,tmux.conf}; do
    if [ -f $file ]; then
         mv "$file" "${file}_backup" 
    fi

    ln -s ~/.dotfiles/$(basename $file) $file
done
unset file

