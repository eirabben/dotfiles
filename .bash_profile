# Export path for overriding osx defaults
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Load dotfiles
for file in ~/.{bashrc,bash_prompt,aliases}; do
	[ -r "$file" ] && source "$file"
done
unset file