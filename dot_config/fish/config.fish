#################################################
# Path
#################################################

set -g fish_user_paths "/opt/homebrew/bin" "/opt/homebrew/sbin" "/usr/local/bin" "/usr/local/sbin" "$HOME/.composer/vendor/bin" $fish_user_paths
fish_add_path "/opt/homebrew/opt/mysql-client/bin"

#################################################
# Customization
#################################################

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end
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

alias dot "cd ~/.local/share/chezmoi"
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

# DDEV aliases
function dphp
  ddev exec php $argv
end

function dcomposer
  ddev composer $argv
end

function dcraft
  ddev exec php craft $argv
end

function dyarn
  ddev exec yarn $argv
end
