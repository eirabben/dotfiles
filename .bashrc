# Load prompt config and aliases
for file in ~/.dotfiles/.{bash_prompt,aliases,git-completion.bash}; do
  [ -r "$file" ] && source "$file"
done
unset file

