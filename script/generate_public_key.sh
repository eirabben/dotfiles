#!/usr/local/bin/bash

function generate_public_key {
    pub=$HOME/.ssh/id_rsa.pub

	# Create it only if it does not exist
	if [ ! -f $pub ]; then
		echo "Generating SSH key"
		ssh-keygen -t rsa
	fi

	# Copy to clipboard
	if [ -f $pub ]; then
		cat $pub | pbcopy
		echo "SSH public key copied to clipboard."
	fi
}

generate_public_key
