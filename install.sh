#!/bin/bash

# Create symlinks, move backups to backup directory
for file in $HOME/.{bash_profile,bashrc,vimrc,tmux.conf,gitconfig}; do
    if [ -f $file ]; then
         mv "$file" "$HOME/.dotfiles/backup/" 
    fi

    ln -s $HOME/.dotfiles/$(basename $file) $file
done
unset file

# Copy vim folder to home directory
if [ -d "$HOME/.vim" ]; then
    mv $HOME/.vim $HOME/.dotfiles/backup/.vim
fi
cp -r $HOME/.dotfiles/.vim $HOME/.vim

# Add vundle to vim folder
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# Install bundles
vim +BundleInstall +qall

# If xfce-terminal is installed, link to color scheme
if [ -d "$HOME/.config/xfce/terminal" ]; then
    if [ -f "$HOME/.config/xfce/terminal/terminalrc" ]; then
        mv $HOME/.config/xfce/terminal/terminalrc $HOME/.config/xfce/terminal/terminalrc_backup
        ln -s $HOME/.dotfiles/base16/base16-xfce4-terminal-master/base16-railscasts.dark.terminalrc $HOME/.config/xfce/terminal/terminalrc
    fi
fi

