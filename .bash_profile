
# Load dotfiles
for file in ~/.{bashrc,bash_prompt,aliases}; do
	[ -r "$file" ] && source "$file"
done
unset file