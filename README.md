# dotfiles

Dotfiles for OSX featuring iTerm, Fish, Neovim, Tmux, Git.

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
