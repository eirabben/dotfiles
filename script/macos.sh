#!/bin/bash

function set_computer_name {
    print_question "Enter a name for this computer (no spaces or special characters)"
    get_answer computer_name

    print_action "Setting computer name"
    scutil --set ComputerName $computer_name
    scutil --set LocalHostName $computer_name
    scutil --set HostName $computer_name
    print_ok
}


function generate_public_key {
	pub=$home_dir/.ssh/id_rsa.pub

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

set_computer_name
generate_public_key
