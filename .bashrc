
# Load prompt config and aliases
for file in ~/.dotfiles/.{bash_prompt,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file

