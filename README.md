# dotfiles

Dotfiles for OSX. iTerm, Fish, Neovim, Tmux, Git.

## Installation
NOTE: This will overwrite conflicting files
`$ curl -fsSL https://raw.githubusercontent.com/eirabben/dotfiles/modernize/bootstrap.sh`

```bash
	git clone https://github.com/eirabben/dotfiles.git ~/.dotfiles

	cd ~/.dotfiles
	sudo ./bootstrap.sh
```

## Configuration
Steps after installing;

### Set Fish as default shell
Add `$(which fish)` (the same as `/usr/local/bin/fish`) to `/etc/shells`.
Change the shell with `chsh -s $(which fish)`.

### Install 
Install the Neovim python packages: `$ sudo pip2 install neovim` and `$ sudo pip3 install neovim`.


#Old content

A collection of dotfiles, with colors for vim and iTerm.
My dotfiles for OSX. Customization for Zsh, Tmux and Vim

## Content
**Zsh**

Custom Zsh prompt with completion and some useful aliases

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

**Set up Zsh**
Edit /etc/shells
Add /usr/local/bin/zsh to the end of the file.

Then run chsh -s $(which zsh)

WARNING: The script will overwrite dotfiles in your home directory. 

##Uninstall
Delete the dotfiles you wish to remove from your home folder, along with the
folder `~/.dotfiles`.
