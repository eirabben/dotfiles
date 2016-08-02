#!/bin/bash

function install_homebrew {
	if test ! $(which brew); then
  	print_action "Installing Homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    print_ok
	fi
}

function install_formulae {
  print_action "Updating Homebrew"
	brew update
  print_ok

  print_action "Installing Homebrew formulae"
  print_newline

	install_formula neovim/neovim/neovim
	install_formula fish
	install_formula tmux
	install_formula cmake
	install_formula python3
	install_formula tree

  print_ok
}

function install_formula {
	brew list $1 > /dev/null 2>&1 | true
	if [[ ${PIPESTATUS[0]} != 0 ]]; then
		print_action "Installing $1"
		brew install $1 $2
		if [[ $? != 0 ]]; then
			echo "Failed to install $1"
    else
      print_ok
		fi
	fi
}

install_homebrew
install_formulae
