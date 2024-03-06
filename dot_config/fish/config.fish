#################################################
# Path
#################################################

set -g fish_user_paths "/opt/homebrew/bin" "/opt/homebrew/sbin" "$HOME/.composer/vendor/bin" "$HOME/.cargo/bin" "/usr/local/bin" "/usr/local/sbin" $fish_user_paths

#################################################
# Customization
#################################################

zoxide init fish | source

set -U fish_cursor_insert line
set -U fish_cursor_replace_one underscore
set -U fish_cursor_external block
set fish_vi_force_cursor 1

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
alias astrovim "NVIM_APPNAME=astrovim nvim"
alias lazyvim "NVIM_APPNAME=lazyvim nvim"
alias lunarvim "NVIM_APPNAME=lunarvim nvim"
alias nyoomnvim "NVIM_APPNAME=nyoomnvim nvim"
alias lg "lazygit"
alias gg "lazygit"
alias ls "exa -l"
alias ll "exa -l"
alias la "exa -la"
alias lt "exa --tree"
alias tree "exa --tree"
alias cat "bat"

alias c "clear"
alias dot "cd ~/.local/share/chezmoi"
alias sites "cd ~/Code/Sites"
alias dt "cd ~/Desktop"
alias dl "cd ~/Downloads"
alias db "cd ~/Dropbox"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias o "open"
alias oo "open ."

alias dci "ddev composer install"
alias dcu "ddev craft up"
alias dca "ddev composer install && ddev craft up"
alias dcq "ddev craft queue/listen --verbose"
alias dyd "ddev yarn run dev"

#################################################
# Functions
#################################################

function edit
  fzf -m | xargs $EDITOR
end

function mkd
  mkdir $argv
  cd $argv
end
