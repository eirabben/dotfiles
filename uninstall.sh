#!/bin/bash

# Remove files made by installer
for file in $HOME/.{bash_profile,bashrc,vimrc,tmux.conf,gitconfig,vim}; do
    if [ -f $file ]; then
        rm $file
    fi
done
unset file

