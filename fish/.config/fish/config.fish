#################################################
# Path
#################################################

set -g fish_user_paths "/Users/eirik/.cargo/bin" "/Users/eirik/.composer/vendor/bin" $fish_user_paths

# Old versions, may not be needed
# set -g fish_user_paths "/Users/eirik/.composer/vendor/bin" "/usr/local/bin" "/usr/local/sbin" $fish_user_paths

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
