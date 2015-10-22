#/bin/bash

set -e

# Dotfiles directory
DOTFILES_ROOT=$(pwd)

# Colors
underline=$(tput smul)
reset=$(tput sgr0)
red=$(tput setaf 124)
green=$(tput setaf 64)
blue=$(tput setaf 33)
white=$(tput setaf 15)

# Formatting functions
heading () {
    printf "\n\n${underline}$1${reset}"
}

info () {
    printf "\n$1"
}

user () {
    printf "\n[${green}?${reset}] $1 "
}

user_input () {
    printf "${blue}"
    read -e $1
    printf "${reset}"
    printf "\033[1A"
}

success () {
    printf "${green}$1${reset}"
}

fail () {
    printf "${red}$1${reset}"
}

git_credential='cache'
if [ "$(uname -s)" == "Darwin" ]
then
    git_credential='osxkeychain'
fi

heading "Reading preferences"
user "What is your Github Author name?"
user_input git_authorname
user "What is your github author email?"
user_input git_authoremail

info "Updating gitconfig..."
sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" ${DOTFILES_ROOT}/git/gitconfig.example > ${DOTFILES_ROOT}/git/gitconfig.symlink
success "OK"

# Create SSH key if it doesn't exist
pub=$HOME/.ssh/id_rsa.pub
heading "Checking for SSH key, generating one if it does not exist"
[[ -f $pub ]] || ssh-keygen -t rsa

info "Copying public key to clipboard..."
[[ -f $pub ]] && cat $pub | pbcopy
success "OK"

heading "Symlinking dotfiles to ~";
for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
do
    dst="$HOME/.$(basename "${src%.*}")"
    info "Linking ${dst}..."
    ln -nfs "$src" "$dst"
    success "OK"
done

printf "\n"


