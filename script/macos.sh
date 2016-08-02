#!/bin/bash

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

generate_public_key
