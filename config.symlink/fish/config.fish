# Aliases

# Navigation and folders
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias c "clear"
alias dl "cd ~/Downloads"
alias db "cd ~/Dropbox"
alias pr "cd ~/Projects"
alias dot "cd ~/.dotfiles"
alias o "open"
alias oo "open ."

# Applications
# Editor
alias vim "nvim"

# Vagrant aliases
alias vs "vagrant status"
alias vup "vagrant up"
alias vhalt "vagrant halt"
alias vssh "vagrant ssh"

# Pipe my public key to my clipboard.
alias pubkey "more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"


# Fish git prompt
# Documentation here:
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_git_prompt.fish

# What to show
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'auto'
set __fish_git_prompt_showstashstate 'yes'

# Colors
set __fish_git_prompt_color_branch cyan

# Local state chars
set __fish_git_prompt_char_dirtystate '!' # File has been modified
set __fish_git_prompt_char_stagedstate '+' # File is staged
set __fish_git_prompt_char_untrackedfiles '?' # Untracked file
set __fish_git_prompt_char_stashstate '$'

# Upstream state chars
set __fish_git_prompt_char_upstream_ahead '>'
set __fish_git_prompt_char_upstream_behind '>'
set __fish_git_prompt_char_upstream_equal '='
set __fish_git_prompt_char_upstream_diverged '<>'

# Separators
set __fish_git_prompt_char_stateseparator " ["
set __fish_git_prompt_char_upstream_prefix "|"
