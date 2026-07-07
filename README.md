# Dotfiles

Personal macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).
Targets Apple Silicon (`/opt/homebrew`).

## Configs

- **Fish** — shell (vi key bindings), with [Starship](https://starship.rs) prompt and [zoxide](https://github.com/ajeetdsouza/zoxide) as `cd`
- **Zellij** — terminal multiplexer
- **Neovim** — editor ([LazyVim](https://www.lazyvim.org))
- **Ghostty** — terminal emulator
- **Git**

Package installation is driven by the [`Brewfile`](Brewfile).

## New machine setup

1. **Install Homebrew** (or run [`script/install_brew.sh`](script/install_brew.sh)):

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install chezmoi and apply this repo.** `chezmoi init` prompts for git
   name/email and home directory, then applies:

   ```sh
   brew install chezmoi
   chezmoi init --apply https://github.com/eirabben/dotfiles.git
   ```

   On `apply`, a chezmoi hook automatically runs `brew bundle` to install
   everything in the `Brewfile` (packages, casks, and fonts).

3. **Run the remaining one-time setup scripts** (in [`script/`](script/), not
   run automatically):

   ```sh
   ./script/change_shell.sh          # make fish the default shell
   ./script/set_computer_name.sh     # set the machine's hostname
   ./script/generate_public_key.sh   # create an SSH key + copy it to the clipboard
   ```

## Day-to-day

```sh
chezmoi diff             # preview pending changes
chezmoi apply            # apply changes to the home directory
chezmoi edit <file>      # edit a managed file
chezmoi re-add           # pull external edits back into the source
```

After installing or removing Homebrew packages, update the `Brewfile`:

```sh
brew bundle dump --force --file ~/.local/share/chezmoi/Brewfile
```

Editing the `Brewfile` re-triggers the `brew bundle` hook on the next
`chezmoi apply`.
