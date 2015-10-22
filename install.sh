#/bin/bash

DOTFILES_ROOT=$(pwd)

# Colors
UNDERLINE=$(tput smul)
END_UNDERLINE=$(tput rmul)
RESET=$(tput sgr0);
RED=$(tput setaf 124);
GREEN=$(tput setaf 64)
BLUE=$(tput setaf 33)
WHITE=$(tput setaf 15);

# Create SSH key if it doesn't exist
pub=$HOME/.ssh/id_rsa.pub
printf "${UNDERLINE}${WHITE}Checking for SSH key, generating one if it does not exist${RESET}${END_UNDERLINE}\n"
[[ -f $pub ]] || ssh-keygen -t rsa

printf "Copying public key to clipboard..."
[[ -f $pub ]] && cat $pub | pbcopy
printf "${BLUE}OK${RESET}\n"

printf "\n${UNDERLINE}Symlinking dotfiles to ~${END_UNDERLINE}\n"
for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
do
    dst="$HOME/.$(basename "${src%.*}")"
    printf "Linking ${dst}..."
    ln -nfs "$src" "$dst"
    printf "${BLUE}OK${RESET}\n"
done
