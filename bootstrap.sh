#!/bin/bash


# Dotfiles directory
DOTFILES_ROOT=$HOME/.dotfiles

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

function clone_repo {
	if [ ! -d $DOTFILES_ROOT ]; then
        action "Cloning dotfiles repo"
		git clone https://github.com/eirabben/dotfiles.git $DOTFILES_ROOT
        print_ok
	fi
}

function install_homebrew {
	if test ! $(which brew)
	then
        action "Installing Homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        print_ok
	fi
}

function install_formulae {
		brew update

		install_formula neovim/neovim/neovim
		install_formula fish
		install_formula tmux
		install_formula cmake
		install_formula ctags
		install_formula tree
		install_formula python
		install_formula python3
}

function install_formula {
	brew list $1 > /dev/null 2>&1 | true
	if [[ ${PIPESTATUS[0]} != 0 ]]; then
		action "Installing $1"
		brew install $1 $2
		if [[ $? != 0 ]]; then
			echo "Failed to install $1"
        else 
            print_ok
		fi
	fi
}

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

	ln -sf $src $dst
	print_info "File $dst created."
}

function bootstrap {
	print_heading "Bootstrapping dotfiles"
	
    # Install homebrew and required formulae
	install_homebrew
	install_formulae

    # Clone the repo
    clone_repo
    
    # Generate a public SSH key
    gen_pub_key

	# Install Vim Plug for neovim
	install_vim_plug

    # Update the gitconfig
	update_gitconfig

    # Symlink the dotfiles
	symlink_dotfiles

    # Finished
	print_info "All done!"
	print_newline
}

bootstrap
