#dotfiles
A collection of dotfiles, with colors for vim and iTerm.

##Content
**Bash**

Highly customized bash shell with a custom `$PS1` stolen from Mathias Bynens.
Helpful aliases for navigation and applications.
The files are structured in a logical way.

**Vim**

A very clean and easy to understand `.vimrc` with good documentation.
This file includes a set of sensible standards, as well as color scheme settings,
key-bindings and `Vundle` setup. The current color scheme is base16.

**Git**

Customized gitconfig with simple aliases.

**Tmux**

Tmux customization with vim-like bindings and color scheme integration.

**Color scheme**

The beautiful base16 theme is included in this repository. The default in use is
base16-railscasts, but feel free to change to one of the other flavours.

This repository currently provides color schemes for Vim and iTerm (Mac OSX).
The terminal theme is required for the Vim theme to work properly. You will
need to manually add the iTerm color scheme via the iTerm settings panel.

##Installation
Easily install and update your dotfiles with the *install* and *update* scripts.

**To install:**

Clone the git repository:
```bash
    git clone https://github.com/eirabben/dotfiles.git ~/.dotfiles
```

cd into the .dotfiles directory and run the install.sh script:
```bash
    cd ~/.dotfiles
    ./install.sh
```

This script will move any conflicting files into `~/.dotfiles/backup` to make it
easy to revert to your old configuration if you wish.

**To update:**

cd into the .dotfiles directory and run update.sh:
```bash
    cd ~/.dotfiles
    ./update.sh
```

The update script simply issues a pull request for this repo as well as the Vundle
repo, located in `~/.vim/bundle/vundle` after installation.

##Uninstall
Run the `uninstall.sh` script to uninstall. This will remove links and directories
made by the installer. Any old files are found in the ~/.dotfiles/backup/ folder.


