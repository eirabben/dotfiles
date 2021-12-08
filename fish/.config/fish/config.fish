#################################################
# Path
#################################################

set -g fish_user_paths "/usr/local/bin" "/usr/local/sbin" "$HOME/.composer/vendor/bin" $fish_user_paths

#################################################
# Customization
#################################################

starship init fish | source

#################################################
# Editor
#################################################

set -Ux EDITOR nvim

#################################################
# Aliases
#################################################

alias vim "nvim"
alias lg "lazygit"

alias c "clear"

alias dot "cd ~/.dotfiles"
alias sites "cd ~/Code/Sites"
alias dt "cd ~/Desktop"
alias dl "cd ~/Downloads"
alias db "cd ~/Dropbox"
alias ... "cd ../.."
alias o "open"
alias oo "open ."

#################################################
# Functions
#################################################

function mkd
  mkdir $argv
  cd $argv
end

function mux
  tmuxinator $argv
end
