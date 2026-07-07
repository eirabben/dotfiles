#!/usr/bin/env bash

function generate_public_key {
    key=$HOME/.ssh/id_ed25519
    pub=$key.pub

	# Create it only if it does not exist
	if [ ! -f $pub ]; then
		echo "Generating SSH key"
		ssh-keygen -t ed25519 -f $key
	fi

	# Copy to clipboard
	if [ -f $pub ]; then
		cat $pub | pbcopy
		echo "SSH public key copied to clipboard."
	fi
}

generate_public_key
