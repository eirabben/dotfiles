# Path
set -x PATH $PATH ~/.composer/vendor/bin


# Editor
set -Ux EDITOR nvim


# Aliases
alias vim "nvim"
alias c "clear"


# Navigation
# alias dot "cd ~/.dotfiles"
# alias code "cd ~/Code"
# alias dt "cd ~/Desktop"
# alias dl "cd ~/Downloads"
# alias db "cd ~/Dropbox"
alias ... "cd ../.."
alias o "open"
alias oo "open ."


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

function mux
  tmuxinator $argv
end
