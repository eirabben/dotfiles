#!/bin/bash

function generate_tmux_conf {
  print_action "Generating tmux config"
  generate_file "$dotfiles_dir/tmux/tmux.conf.template" "$home_dir"
  print_ok
}

generate_tmux_conf
