function fish_prompt
    # Username
    set -l username (set_color red)"$USER"(set_color normal)

    # Hostname
    set -l hostname (set_color yellow)(hostname -s)(set_color normal)

    # Working directory
    set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    set -l working_directory (set_color green)(echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')(set_color normal)

    # Git status
    set -l git_status (__fish_git_prompt | sed -e 's/(/on /g' | sed -e 's/)/\]/g')

    # Suffix
    set -l suffix '$'

    # Display the prompt
    printf "\n%s at %s in %s%s" "$username" "$hostname" "$working_directory" "$git_status"
    printf "\n%s " "$suffix"
end
