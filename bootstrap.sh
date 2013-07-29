#!/bin/bash

# TODO: Copy color schemes for terminals, vim and tmux
# TODO: Add vundle to vim
# TODO: Make update mode for bootstrap.sh

for file in ~/.{bash_profile,bashrc,vimrc,tmux.conf}; do
    if [ -f $file ]; then
         mv "$file" "${file}_backup" 
    fi

    ln -s ~/.dotfiles/$(basename $file) $file
done
unset file

