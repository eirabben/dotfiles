#!/bin/bash

function generate_gitconfig {
	print_question "What is your Github author name?"
	get_answer git_authorname
	print_question "What is your Github author email?"
	get_answer git_authoremail

	print_action "Generating Git config"
	generate_file "$dotfiles_dir/git/config.template" "$home_dir/.config/git" "s/AUTHORNAME/$git_authorname/g;s/AUTHOREMAIL/$git_authoremail/g"
	print_ok
}

generate_gitconfig
