autoload -U colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

bold="%B";
endbold="%b"
reset="%f%b";
black="%F{0}";
blue="%F{33}";
cyan="%F{37}";
green="%F{64}";
orange="%F{166}";
purple="%F{125}";
red="%F{124}";
violet="%F{61}";
white="%F{15}";
yellow="%F{136}";

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null;
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " ";
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} ";
  fi
}

user_name() {
    if [[ "${USER}" == "root" ]]; then
        echo "${red}%n${reset}";
    else
        echo "${orange}%n${reset}";
    fi;
}

host_name() {
    if [[ "${SSH_TTY}" ]]; then
        echo "${bold}${red}%m${reset}";
    else
        echo "${yellow}%m${reset}";
    fi;
}

directory_name() {
  echo "${bold}${green}%~${reset}"
}

export PROMPT=$'\n$(user_name) at $(host_name) in $(directory_name) $(git_dirty)$(need_push)\n$ ';
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}";
}

precmd() {
  title "zsh" "%m" "%55<...<%~";
  set_prompt;
}

