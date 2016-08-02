#!/bin/bash

function install_vim_plug {
	plug_file=$home_dir/.config/nvim/autoload/plug.vim
	if [[ ! -f "$plug_file" ]]; then
		print_action "Downloading vim-plug"
		curl -fLo $plug_file --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		print_ok
	fi
}

function link_vim_colors {
	ln -s "$dotfiles_dir/nvim/colors" "$home_dir/.config/nvim/colors"
}

function generate_nvim_config {
	print_action "Generating Neovim config"
	generate_file "$dotfiles_dir/nvim/init.vim.template" "$home_dir/.config/nvim"
	print_ok
}

generate_nvim_config
link_vim_colors
install_vim_plug
