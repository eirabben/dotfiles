# Colors
# set normal (set_color normal)
# set magenta (set_color magenta)
# set yellow (set_color yellow)
# set green (set_color green)
# set red (set_color red)
# set gray (set_color -o black)

# Fish git prompt
#set __fish_git_prompt_showdirtystate 'yes'
#set __fish_git_prompt_showstashstate 'yes'
#set __fish_git_prompt_showuntrackedfiles 'yes'
#set __fish_git_prompt_showupstream 'yes'
#set __fish_git_prompt_showcolorhints 'yes'
# set __fish_git_prompt_color_branch yellow
# set __fish_git_prompt_color_branch_detached red

# Status Chars
#set __fish_git_prompt_char_dirtystate '!'
#set __fish_git_prompt_char_stagedstate '+'
#set __fish_git_prompt_char_untrackedfiles '?'
#set __fish_git_prompt_char_stashstate '$'
#set __fish_git_prompt_char_upstream_ahead '>'
#set __fish_git_prompt_char_upstream_behind '<'

function fish_prompt --description 'Write out the prompt'
  set -l color_cwd
  set -l suffix
  switch $USER
    case root toor
      if set -q fish_color_cwd_root
        set color_cwd $fish_color_cwd_root
      else
        set color_cwd $fish_color_cwd
      end
      set suffix '#'
    case '*'
      set color_cwd $fish_color_cwd
      set suffix '>'
    end

  echo -n -s (set_color normal) "$USER" (set_color normal) @ (set_color normal) (prompt_hostname) ' ' (set_color blue) (prompt_pwd) (set_color brblack) (__fish_git_prompt) (set_color normal) "$suffix "
end
