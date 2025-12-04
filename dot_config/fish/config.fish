#################################################
# Path
#################################################

set -g fish_user_paths /opt/homebrew/opt/php@8.3/bin /opt/homebrew/opt/php@8.3/sbin /opt/homebrew/bin /opt/homebrew/sbin "$HOME/.composer/vendor/bin" "$HOME/.cargo/bin" /usr/local/bin /usr/local/sbin "$HOME/Code/ukeweb_devbox" $fish_user_paths

#################################################
# Customization
#################################################

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

#################################################
# Editor
#################################################

set -Ux EDITOR nvim

#################################################
# Aliases
#################################################

alias ls "eza -l"
alias ll "eza -l"
alias la "eza -la"
alias lt "eza --tree"
alias tree "eza --tree"
alias cat bat
alias lg lazygit
alias gg lazygit
alias vim nvim

alias c clear
alias dot "cd ~/.local/share/chezmoi"
alias sites "cd ~/Code/Sites"
alias dt "cd ~/Desktop"
alias dl "cd ~/Downloads"
alias db "cd ~/Library/CloudStorage/Dropbox"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias o open
alias oo "open ."

alias ddci "ddev composer install"
alias ddcu "ddev craft up"
alias ddciu "ddev composer install && ddev craft up"
alias ddcq "ddev craft queue/listen --verbose"
alias ddyd "ddev yarn run dev"

#################################################
# Functions
#################################################

function project
    set project_dir "$HOME/Code/Sites/$argv"
    if test -d $project_dir
        cd $project_dir
        zellij -s "$argv" --layout project
    else
        echo "No project at $project_dir"
    end
end

function edit
    fzf -m | xargs $EDITOR
end

function mkd
    mkdir $argv
    cd $argv
end

starship init fish | source
zoxide init fish | source
alias cd z
