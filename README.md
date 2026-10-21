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

## Cheatsheet

### Moving around

| Keys / command | Action |
|---|---|
| `Ctrl h/j/k/l` | Move between nvim splits and zellij panes (left/right wraps to tabs) |
| `project` | Open a zellij project session (nvim, opencode, shell tabs) for the current folder, or switch to it if it exists |
| `project <path>` | Same for a folder path, or a zoxide query like `project dotfiles` |
| `Ctrl a`, `w` | Switch between running and saved zellij sessions |
| `cd <query>` / `cdi` | zoxide jump / interactive picker |
| `Ctrl r` | Search history (atuin) |
| `Ctrl t` / `Alt c` | fzf: insert file / cd into directory |
| `fe` | Fuzzy-find files and open in nvim |
| `y` | yazi file manager; `cd`s to where you quit |
| `Ctrl Alt f` | fzf.fish: search files |
| `Ctrl Alt l` / `Ctrl Alt s` | fzf.fish: git log / git status |
| `Ctrl Alt p` | fzf.fish: processes |

### Zellij

Starts in **locked** mode, so keys go to the app. `Ctrl a` enters normal mode,
then pick a mode. `Esc`/`Enter` goes back to locked. `Ctrl a`, `?` shows a
cheatsheet ([`dot_config/zellij/cheatsheet.md`](dot_config/zellij/cheatsheet.md)).

| After `Ctrl a` | Action |
|---|---|
| `w` | Switch project session |
| `f` | Fuzzy-find a tab ([room](https://github.com/rvcas/room)) |
| `g` | lazygit in a floating pane |
| `[` `]` | Cycle pane arrangements: side by side, rows, stacked |
| `?` | Cheatsheet |

| Mode (from normal) | Useful keys |
|---|---|
| `p` pane | `n` new, `r` right, `d` down, `s` stacked, `x` close, `f` fullscreen, `w` floating, `c` rename |
| `t` tab | `n` new, `x` close, `r` rename, `1-9` go to, `b` break pane out, `[` `]` break left/right |
| `r` resize | `h/j/k/l` grow, `H/J/K/L` shrink |
| `m` move | `h/j/k/l` move pane |
| `s` scroll | `f` search, `e` edit scrollback in nvim, `c` copy last command output |
| `o` session | `w` session manager, `d` detach, `l` layouts |

Sessions are saved, so after a reboot they can be brought back from the
session manager (`Ctrl a`, `w`). Commands like nvim come back paused; press
Enter in the pane to start them.

Always available in locked mode: `Alt n` new pane, `Alt f` floating panes,
`Alt i/o` move tab, `Alt +/-` resize.

**opencode status:** the right side of the status bar shows each project's
opencode state: `●` working, `▲` waiting for you, `■` done, `×` error. A macOS
notification is sent when one finishes or needs you, unless you are looking at
it. This is an opencode plugin
([`dot_config/opencode/plugins/zellij-agent-state`](dot_config/opencode/plugins/zellij-agent-state))
reporting to [`zellij-agent-state`](dot_local/bin/executable_zellij-agent-state),
which zjstatus polls.

### Abbreviations

Fish abbreviations expand inline when you press space. Run `abbr` to list all.

| Prefix | Expands to |
|---|---|
| `g…` | git: `gs` status, `ga`/`gaa` add, `gcm` commit -m, `gp`/`gpf` push, `gl` pull, `gd`/`gds` diff, `gsw`/`gswc` switch, `glog`, `gst`/`gstp` stash |
| `dd…` | ddev: `dds` start, `ddx` stop, `ddr` restart, `ddsh` ssh, `ddc` craft, `ddci`/`ddcu`/`ddciu`, `ddcq` queue, `ddim`/`ddex` db import/export |
| `db…` / `dpc` | devbox: `dbx`, `dpc` php craft, `dbc` composer, `dbn` npm, `dbp` pnpm |
| `dc…` | docker compose: `dc`, `dcu` up -d, `dcd` down, `dcl` logs -f; `dps` docker ps |
| `b…` / `cz…` / `zj…` | brew (`bi`, `bs`, `bu`), chezmoi (`czd`, `cza`, `cze`), zellij (`zjl`, `zjk`) |
| `up` | `topgrade`: update brew, nvim plugins, npm/pnpm/composer globals, tldr pages and more |

Other tools: `tldr <cmd>` for quick examples, `dust` for disk usage per
folder, `duf` for disk overview, `spf` for superfile (a file manager with
vim-style keys: `j/k` move, `enter` open, `-` parent folder, `y/x/p` copy/cut/paste,
`d` delete, `a` new, `r` rename, `q` close panel, `ctrl+c` quit, `?` help).

Fish plugins are listed in `dot_config/fish/fish_plugins` and installed by
fisher on `chezmoi apply`. After `fisher install`/`remove`, run
`chezmoi re-add ~/.config/fish/fish_plugins`.

Git diffs, `git log -p` and lazygit use [delta](https://github.com/dandavison/delta)
(`n`/`N` jumps between files in the pager).
