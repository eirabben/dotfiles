#!/bin/bash

home="$HOME"
dotfiles="$HOME/.dotfiles"

if [[ -d "$dotfiles" ]]; then
  echo "Symlinking dotfiles from $dotfiles"
else
  echo "$dotfiles does not exist"
  exit 1
fi

for file in .bash_profile .bashrc .gitconfig .tmux.conf .vim .vimrc; do
	echo "\tLinking $file"
	ln -s ~/.dotfiles/$file ~/$file
done

vim +PluginInstall +qall
