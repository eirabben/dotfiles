#!/usr/local/bin/bash

DOTFILES_DIR=$HOME/.dotfiles

function link_dotfile {
    mkdir -p $HOME/$(dirname $2)
    ln -s $DOTFILES_DIR/$1 $HOME/$2
}

function link_dotfiles {
    link_dotfile fish/config.fish .config/fish/config.fish
    link_dotfile fish/tmuxinator.fish .config/fish/completions/tmuxinator.fish

    link_dotfile git/config .config/git/config

    link_dotfile nvim/init.vim .config/nvim/init.vim
    link_dotfile nvim/colors .config/nvim/colors
    link_dotfile nvim/autoload .config/nvim/autoload

    link_dotfile starship/starship.toml .config/starship.toml

    link_dotfile tmux/tmux.conf .tmux.conf
}

link_dotfiles
