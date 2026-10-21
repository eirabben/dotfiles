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

# Apply the Catppuccin syntax theme once (stored in universal variables).
if status is-interactive; and not set -q __catppuccin_theme_applied
    fish_config theme choose "Catppuccin Macchiato"
    and set -U __catppuccin_theme_applied 1
end

# Many Go tools (e.g. tuios) default to ~/Library/Application Support on macOS
# unless XDG_CONFIG_HOME is set. Point them at the chezmoi-managed ~/.config.
set -gx XDG_CONFIG_HOME "$HOME/.config"

# Match the Catppuccin Macchiato theme used everywhere else.
set -gx BAT_THEME "Catppuccin Macchiato"

# On macOS lazygit reads ~/Library/Application Support/lazygit by default and
# ignores ~/.config/lazygit entirely. Point it at the chezmoi-managed config.
set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml"

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

#################################################
# Abbreviations (expand inline when you press space)
#################################################

# Git
abbr -a g git
abbr -a gs git status
abbr -a ga git add
abbr -a gaa git add --all
abbr -a gc git commit
abbr -a gcm --set-cursor 'git commit -m "%"'
abbr -a gca git commit --amend
abbr -a gp git push
abbr -a gpf git push --force-with-lease
abbr -a gl git pull
abbr -a gf git fetch
abbr -a gd git diff
abbr -a gds git diff --staged
abbr -a gsw git switch
abbr -a gswc git switch -c
abbr -a gco git checkout
abbr -a glog git log --oneline --graph --decorate -20
abbr -a gst git stash
abbr -a gstp git stash pop

# DDEV
abbr -a dds ddev start
abbr -a ddx ddev stop
abbr -a ddr ddev restart
abbr -a ddl ddev launch
abbr -a ddsh ddev ssh
abbr -a ddc ddev craft
abbr -a ddci ddev composer install
abbr -a ddcu ddev craft up
abbr -a ddciu 'ddev composer install && ddev craft up'
abbr -a ddcq ddev craft queue/listen --verbose
abbr -a ddn ddev npm
abbr -a ddyd ddev yarn run dev
abbr -a ddim ddev import-db --file=
abbr -a ddex ddev export-db --file=

# devbox
abbr -a dbx devbox
abbr -a dpc devbox php craft
abbr -a dbc devbox composer
abbr -a dbn devbox npm
abbr -a dbp devbox pnpm

# Docker
abbr -a dc docker compose
abbr -a dcu docker compose up -d
abbr -a dcd docker compose down
abbr -a dcl docker compose logs -f
abbr -a dps docker ps

# Homebrew
abbr -a bi brew install
abbr -a bs brew search
abbr -a bu 'brew update && brew upgrade'

# chezmoi
abbr -a cz chezmoi
abbr -a czd chezmoi diff
abbr -a cza chezmoi apply
abbr -a cze chezmoi edit

# Zellij
abbr -a zj zellij
abbr -a zjl zellij list-sessions
abbr -a zjk zellij kill-session

#################################################
# Functions
#################################################

function project --description "Open (or attach to) a zellij session for a project in ~/Code/Sites"
    set -l sites "$HOME/Code/Sites"
    set -l name $argv[1]

    if test -z "$name"
        set name (command ls $sites | fzf --height 40% --reverse --prompt "project> " \
            --preview "eza --icons --git -1 --color=always $sites/{}")
        or return
    end

    set -l dir "$sites/$name"
    if not test -d $dir
        echo "No project at $dir"
        return 1
    end

    if set -q ZELLIJ
        # Already inside zellij: switch sessions instead of nesting one.
        zellij action switch-session $name --layout project --cwd $dir
        return
    end

    cd $dir
    if contains -- $name (zellij list-sessions --short 2>/dev/null)
        zellij attach $name
    else
        zellij -s $name --layout project
    end
end
complete -c project -f -a "(command ls ~/Code/Sites)"

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
# Loaded after fzf so atuin owns Ctrl-R (history); fzf keeps Ctrl-T / Alt-C.
atuin init fish --disable-up-arrow | source

# Note: `zi` (interactive fuzzy directory jump) is provided by zoxide's init.
alias cd z
