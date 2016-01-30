# Navigation shortcuts
alias la="ls -lahF"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"


# Folder shortcuts
alias dl="cd ~/Downloads"
alias db="cd ~/Dropbox"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"
alias pr="cd ~/Projects"
alias dot="cd ~/.dotfiles"
alias vg="cd ~/Tools/vagrant"
alias tl="cd ~/Tools"
alias o="open "
alias oo="open ."

# Create directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}


# Vagrant aliases
alias vs="vagrant status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"

# Tmux shortcuts


# Other shortcuts
# Ping google
alias pingg="ping -c 4 www.google.com"
alias brc="source ~/.bashrc"

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Add texbin to the path 
export PATH=$PATH:/Library/TeX/texbin

# Colors on ls
# Detect which `ls` flavor is in use
#if ls --color > /dev/null 2>&1; then # GNU `ls`
	#colorflag="--color"
#else # OS X `ls`
	#colorflag="-G"
#fi

# List all files colorized in long format
#alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
#alias la="ls -lahF ${colorflag}"

# Always use color output for `ls`
#alias ls="command ls ${colorflag}"
#export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
