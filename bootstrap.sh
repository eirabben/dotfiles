#!/bin/bash

# Directories
dotfiles_dir="$HOME/.dotfiles"
home_dir="$HOME"
script_dir="$dotfiles_dir/script"
symlink_dir="$dotfiles_dir/symlink"

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

# File generation and linking
function generate_file {
	# Create destination directory if it does not exist
	if [[ ! -d "$2" ]]; then
		mkdir -p "$2"
	fi

	# Strip template extension and path for destination file
	local dest_file=$(basename "${1%.template}")

	# Perform substitutions and save file to the symlink directory
	sed -e "$3" "$1" > "$symlink_dir/$dest_file"

	# Link the file
	ln -sf "$symlink_dir/$dest_file" "$2/$dest_file"
}

# Call config scripts
# Change execution order by changing the number before the filename
function run_install_scripts {
	for script in $(find -H "$script_dir" -name "*.sh"); do
		source $script
	done
}

# function clone_repo {
# 	if [ ! -d $dotfiles_dir ]; then
# 		print_action "Cloning dotfiles repo"
# 		git clone https://github.com/eirabben/dotfiles.git $dotfiles_dir
#   	print_ok
# 	fi
# }

function bootstrap {
	print_heading "Bootstrapping dotfiles"

	run_install_scripts

  # Finished
	print_info "All done!"
	print_newline
	print_heading "Don't forget to set Fish as your default shell:"
	print_info "Add '/usr/local/bin/fish' (which fish) to /etc/shells"
	print_info "Then run 'chsh -s /usr/local/bin/fish'"
	print_newline
	print_heading "Install neovim plugins"
	print_info "Run 'sudo pip3 install neovim' to enable python plugins for Neovim"
	print_info "Start Neovim and run ':PlugInstall'"
	print_newline
}

bootstrap
