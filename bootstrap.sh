#!/bin/bash

# TODO: copy color schemes and other files.

for file in ~/.{bash_profile,bashrc,vimrc}; do

    if [ -f $file ]; then
         mv "$file" "${file}_backup" 
    fi

    ln -s ~/.dotfiles/$(basename $file) $file

done
unset file

