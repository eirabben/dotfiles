# Load colors
autoload -U colors && colors

# Colors from Solarized
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
  git="$commands[git]";
else
  git="/usr/bin/git";
fi

git_dirty() {
    if $(! $git status -s &> /dev/null); then
        return;
    else
        echo "on ${violet}$(git_branch_name)${blue}$(git_status_prompt)${reset}";

        # This use this for different prompt if dirty
        #if [[ $($git status --porcelain) == "" ]]; then
            #echo "on ${green}$(git_branch_name)${reset}";
        #else
            #echo "on ${red}$(git_branch_name)${reset}";
        #fi
    fi
}

git_branch_name() {
    ref=$($git symbolic-ref HEAD 2>/dev/null) || return;
    echo "${ref#refs/heads/}";
}

git_status_prompt() {
    local s='';

    # Ensure the index is up to date
    $git update-index --really-refresh -q &>/dev/null;

    # Check for uncommitted changes
    if ! $($git diff --quiet --ignore-submodules --cached); then
        s+='+';
    fi;

    # Check for unstaged changes
    if ! $($git diff-files --quiet --ignore-submodules --); then
        s+='!';
    fi;

    # Check for untracked files
    if [ -n "$($git ls-files --others --exclude-standard)" ]; then
        s+='?';
    fi;

    # Check for stashed files
    if $($git rev-parse --verify refs/stash &>/dev/null); then
        s+='$';
    fi;

    # Check for unpushed changes
    if [[ $($git cherry -v @{upstream} 2>/dev/null) != "" ]]; then
        s+='^';
    fi;

    [ -n "${s}" ] && s=" [${s}]";

    echo "$s";
}

user_name() {
    # Highlight username when logged in as root
    if [[ "${USER}" == "root" ]]; then
        echo "${red}%n${reset}";
    else
        echo "${orange}%n${reset}";
    fi;
}

host_name() {
    # Highlight hostname when connected via SSH
    if [[ "${SSH_TTY}" ]]; then
        echo "${bold}${red}%m${reset}";
    else
        echo "${yellow}%m${reset}";
    fi;
}

directory_name() {
    echo "${bold}${green}%~${reset}";
}

export PROMPT=$'\n$(user_name) at $(host_name) in $(directory_name) $(git_dirty)\n$ ';
set_prompt () {
    export RPROMPT="";
}

precmd() {
    title "zsh" "%m" "%55<...<%~";
    set_prompt;
}

