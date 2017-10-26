# Path


# Aliases
alias vim "nvim"
alias c "clear"


# Navigation
alias dot "cd ~/.dotfiles"
alias code "cd ~/Code"
alias dt "cd ~/Desktop"
alias dl "cd ~/Downloads"
alias db "cd ~/Dropbox"
alias ... "cd ../.."
alias o "open"
alias oo "open ."


# Web
alias forge "ssh forge@95.85.58.146"


# Functions

function mkd
  mkdir $argv
  cd $argv
end

function homestead
  cd ~/Code/Homestead
  vagrant $argv
  cd -
end
