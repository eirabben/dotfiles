alias vim "nvim"

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
