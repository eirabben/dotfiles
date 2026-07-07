#################################################
# Path
#################################################

fish_add_path /opt/homebrew/opt/php@8.3/bin /opt/homebrew/opt/php@8.3/sbin /opt/homebrew/bin /opt/homebrew/sbin "$HOME/.composer/vendor/bin" "$HOME/.cargo/bin" "$HOME/.local/bin" /usr/local/bin /usr/local/sbin "$HOME/Code/Repos/devbox"

#################################################
# Customization
#################################################

set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore
set -g fish_cursor_external block
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
# Environment
#################################################

set -gx EDITOR nvim

# Match the Catppuccin Macchiato theme used everywhere else.
set -gx BAT_THEME "Catppuccin Macchiato"

#################################################
# Aliases
#################################################

alias ls "eza --icons --git"
alias ll "eza --icons --git -l"
alias la "eza --icons --git -la"
alias lt "eza --icons --git --tree"
alias tree "eza --icons --git --tree"
alias cat bat
alias lg lazygit
alias gg lazygit
alias vim nvim
alias lvim nvim

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

function fe --description "Fuzzy-find files and open them in the editor"
    fzf -m --preview 'bat --color=always --style=numbers {}' | xargs $EDITOR
end

function mkd --description "Create a directory (with parents) and cd into it"
    mkdir -p $argv[1]
    and cd $argv[1]
end

starship init fish | source
zoxide init fish | source
fzf --fish | source

# Note: `zi` (interactive fuzzy directory jump) is provided by zoxide's init.
alias cd z
