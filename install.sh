#/bin/bash

DOTFILES_ROOT=$(pwd)

for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
do
  dst="$HOME/.$(basename "${src%.*}")"
  ln -nfs "$src" "$dst"
  echo " - File $dst linked."
done
