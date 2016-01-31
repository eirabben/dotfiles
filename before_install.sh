#!/bin/bash

DOTFILES_DIR=$HOME/.dotfiles

function install_formula {
	brew list $1 > /dev/null 2>&1 | true
	if [[ ${PIPESTATUS[0]} != 0 ]]; then
		echo "Installing $1"
		brew install $1 $2
		if [[ $? != 0 ]]; then
			echo "Failed to install $1"
		fi
	fi
}

function install_homebrew {
	if test ! $(which brew)
	then
		echo "Installing Homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew update

		install_formula neovim/neovim/neovim
		install_formula fish
		install_formula tmux
		install_formula cmake
		install_formula ctags
		install_formula tree
		install_formula python
		install_formula python3
	fi
}

function clone_repo {
	if [ ! -d $DOTFILES_DIR ]; then
		echo "Cloning dotfiles repo"
		git clone https://github.com/eirabben/dotfiles.git $DOTFILES_DIR
	fi
}

install_homebrew
clone_repo
