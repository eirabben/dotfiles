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
key-bindings and `Vundle` setup. 

**Git**

Customized gitconfig with simple aliases.

**Tmux**

Tmux customization with vim-like bindings and color scheme integration.

**Color scheme**
The default color scheme is Solarized, some base16 themes are also included.

This repository currently provides color schemes for Vim and iTerm (Mac OSX).
The terminal theme is required for the Vim theme to work properly. You will
need to manually add the iTerm color scheme via the iTerm settings panel.

##Installation
Easily install and update the dotfiles using the `install.sh` script.

**To install:**

Clone the git repository:
```bash
    git clone https://github.com/eirabben/dotfiles.git ~/.dotfiles
```

cd into the .dotfiles directory and run the `install.sh` script:
```bash
    cd ~/.dotfiles
    ./install.sh
```

WARNING: The script will overwrite dotfiles in your home directory. 
The install script will fetch the latest version of this repository. It will
then rsync the dotfiles into your home directory, install Vundle for Vim, 
and get all plugins configured in `.vimrc`.

**To update:**

cd into the .dotfiles directory and run `install.sh`:
```bash
    cd ~/.dotfiles
    ./install.sh
```

##Uninstall
Delete the dotfiles you wish to remove from your home folder, along with the
folder `~/.dotfiles`.
