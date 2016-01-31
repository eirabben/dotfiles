#!/bin/bash

# @TODO: Use nvim as default editor

# Dotfiles directory
DOTFILES_ROOT=$(pwd)

# Colors
RESET=$(tput sgr0)
UNDERLINE=$(tput smul)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

# Formatting functions

function print_heading {
	printf "\n${UNDERLINE}${1}${RESET}\n"
}

function print_info {
	printf "${1}\n"
}

function print_action {
	printf "${1}... "
}

function print_ok {
	printf "[${GREEN}ok${RESET}]\n"
}

function print_question {
	printf "[${GREEN}?${RESET}] ${1} "
}

function get_answer {
	printf "${CYAN}"
	read -e $1
	printf "${RESET}"
}

function print_newline {
	printf "\n"
}

# Actual functions

function gen_pub_key {
	pub=$HOME/.ssh/id_rsa.pub

	# Create it only if it does not exist
	if [ ! -f $pub ]; then
		print_action "Generating SSH key"
		ssh-keygen -t rsa
		print_ok
	fi

	# Copy to clipboard
	if [ -f $pub ]; then
		cat $pub | pbcopy
		print_info "SSH public key copied to clipboard."
	fi
}

function update_gitconfig {
	print_question "What is your Github author name?"
	get_answer git_authorname
	print_question "What is your Github author email?"
	get_answer git_authoremail

	print_action "Generating git config"
	sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" $DOTFILES_ROOT/config.symlink/git/config.example > $DOTFILES_ROOT/config.symlink/git/config
	print_ok
}

function install_vim_plug {
	PLUG_FILE=$DOTFILES_ROOT/config.symlink/nvim/autoload/plug.vim

	print_action "Downloading vim-plug"
	[[ -f $PLUG_FILE ]] || curl -fLo $PLUG_FILE --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	print_ok
}

function symlink_dotfiles {
	print_heading "Linking dotfiles"
	for dotfile in $(find -H $DOTFILES_ROOT -name '*.symlink'); do
		symlink_dotfile $dotfile
	done
}

function symlink_dotfile {
	src=$1
	dst=$HOME/.$(basename "${1%.*}")

	ln -s $src $dst
	print_info "File $dst created."
}

# @TODO: This does not work
function install_homebrew {
	#if [ !$(which -s brew) ]; then
		#print_action "Installing Homebrew"
		#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		#print_ok
	#fi
}

# @TODO: This does not work
function install_formulae {
	#formulae=(neovim/neovim/neovim fish tmux cmake ctags python python3 tree)
	#brew update

	#print_action "Installing brew formulae"
	#for formula in $formulae; do
		#if [[ ! -n $(brew ls --versions $formula) ]]; then
			#brew install $formula
		#fi
	#done
	#print_ok
}

# @TODO: This does not work
function change_shell {
	#if [ $SHELL = "/bin/bash" ]; then
		#print_action "Setting Fish as default shell"
		#echo $(which fish) | sudo tee -a /etc/shells
		#chsh -s $(which fish) $(whoami)
		#print_ok
	#fi
}

function bootstrap {
	print_heading "Bootstrapping dotfiles"
	
	#install_homebrew
	#install_formulae
	gen_pub_key
	install_vim_plug
	update_gitconfig
	symlink_dotfiles
	#change_shell

	print_info "All done!"
	print_newline
}

bootstrap
