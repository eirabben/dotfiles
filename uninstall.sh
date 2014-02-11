#!/bin/bash

# Remove files made by installer
rm $HOME/.bash_profile
rm $HOME/.bashrc
rm $HOME/.vimrc
rm $HOME/.tmux.conf
rm $HOME/.gitconfig
rm $HOME/.vim

# Move original files back to home directory
mv $HOME/.dotfiles/backup/.* $HOME/

