#!/bin/bash

function generate_fish_config {
  print_action "Generating Fish config"
  generate_file "$dotfiles_dir/fish/config.fish.template" "$home_dir/.config/fish"
  generate_file "$dotfiles_dir/fish/fish_prompt.fish.template" "$home_dir/.config/fish/functions"
  print_ok
}

generate_fish_config
