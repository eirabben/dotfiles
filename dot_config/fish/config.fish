#################################################
# Path
#################################################

fish_add_path -g /opt/homebrew/bin /opt/homebrew/sbin "$HOME/.composer/vendor/bin" "$HOME/.cargo/bin" "$HOME/.local/bin" /usr/local/bin /usr/local/sbin "$HOME/Code/Repos/devbox"
# Rex CLI ships inside the app bundle (fish_add_path skips it if Rex isn't installed).
fish_add_path -g "/Applications/Rex Beta.app/Contents/Helpers/Rex Server.rex/Contents/MacOS"

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
# ignores ~/.config/lazygit entirely. Point it at the chezmoi-managed config,
# merged with the Catppuccin theme.
set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/theme.yml"

# eza also defaults to ~/Library/Application Support on macOS (theme.yml lives here).
set -gx EZA_CONFIG_DIR "$HOME/.config/eza"

# Catppuccin Macchiato for fzf (and everything built on it, e.g. fzf.fish).
set -gx FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64,border:#6e738d,label:#cad3f5"

# fzf.fish (installed via fisher, see fish_plugins).
set -g fzf_preview_dir_cmd eza --all --color=always --icons
set -g fzf_fd_opts --hidden --exclude=.git

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
abbr -a up topgrade

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

function project --description "Open (or switch to) a zellij project session for a folder"
    # No argument: the current folder. Otherwise a path, or a zoxide query.
    set -l dir $PWD
    if set -q argv[1]
        if test -d $argv[1]
            set dir (path resolve $argv[1])
        else
            set dir (zoxide query -- $argv)
            or return 1
        end
    end

    set -l name (path basename $dir)

    if set -q ZELLIJ
        # Inside zellij: make sure the session exists (created or resurrected in the
        # background, in the project folder), then switch to it instead of nesting.
        fish --no-config -c 'cd $argv[1]; and zellij attach --create-background $argv[2] options --default-layout project' $dir $name &>/dev/null
        zellij action switch-session $name
    else
        # Attaches if running, resurrects if exited, otherwise creates it with the layout.
        cd $dir
        zellij attach --create $name options --default-layout project
    end
end
complete -c project -x -a "(__fish_complete_directories (commandline -ct))"

function fe --description "Fuzzy-find files and open them in the editor"
    fzf -m --preview 'bat --color=always --style=numbers {}' | xargs $EDITOR
end

function mkd --description "Create a directory (with parents) and cd into it"
    mkdir -p $argv[1]
    and cd $argv[1]
end

function y --description "Open yazi and cd into the directory it was in when it quit"
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and test -n "$cwd"; and test "$cwd" != "$PWD"
        cd "$cwd"
    end
    command rm -f -- "$tmp"
end

starship init fish | source
# Replaces `cd` with zoxide (`cdi` for the interactive picker).
zoxide init fish --cmd cd | source
fzf --fish | source
# fzf.fish: Ctrl-Alt-F files, Ctrl-Alt-L git log, Ctrl-Alt-S git status, Ctrl-Alt-P processes.
# History is left to atuin and Ctrl-V to paste.
if functions -q fzf_configure_bindings
    fzf_configure_bindings --history= --variables=
end
# Loaded after fzf so atuin owns Ctrl-R (history); fzf keeps Ctrl-T / Alt-C.
atuin init fish --disable-up-arrow | source
