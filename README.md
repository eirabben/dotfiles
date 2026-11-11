# Dotfiles

Personal macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).
Targets Apple Silicon (`/opt/homebrew`).

## Configs

- **Fish** — shell (vi key bindings), with [Starship](https://starship.rs) prompt and [zoxide](https://github.com/ajeetdsouza/zoxide) as `cd`
- **Rex** — terminal and multiplexer ([docs](https://www.superlogical.com/rex/docs))
- **Neovim** — editor ([LazyVim](https://www.lazyvim.org))
- **Ghostty** — fallback terminal
- **Git**

Package installation is driven by the [`Brewfile`](Brewfile). Rex is in beta and
not on Homebrew: install `Rex Beta.app` by hand.

## New machine setup

1. **Install Homebrew** (or run [`script/install_brew.sh`](script/install_brew.sh)):

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install chezmoi and apply this repo.** `chezmoi init` prompts for git
   name/email and the Home Assistant MCP webhook URL for opencode (secret,
   stored only in `~/.config/chezmoi/chezmoi.toml`; leave empty to skip), then applies:

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
`chezmoi apply`. It only installs: remove dropped packages with `brew uninstall`.

Configs that used to be managed are listed in [`.chezmoiremove`](.chezmoiremove),
so `chezmoi apply` deletes them from `~`.

## Cheatsheet

### Moving around

| Keys / command | Action |
|---|---|
| `Alt h/j/k/l` | Move between Rex panes (left/right moves to the next tab at the edge) |
| `Ctrl h/j/k/l` | Move between nvim splits |
| `project` | Set up the current Rex session for the current folder: nvim here, lazygit in tab 2, opencode and a shell side by side in tab 3 |
| `project <path>` | Same for a folder path, or a zoxide query like `project dotfiles` |
| `cd <query>` / `cdi` | zoxide jump / interactive picker |
| `Ctrl r` | Search history (atuin) |
| `Ctrl t` / `Alt c` | fzf: insert file / cd into directory |
| `fe` | Fuzzy-find files and open in nvim |
| `y` | yazi file manager; `cd`s to where you quit |
| `spf` | superfile file manager; quit with `Q` to `cd` to where you are |

### Rex

Configured in [`dot_config/rex/init.lua`](dot_config/rex/init.lua). After
`chezmoi apply`, run `rex config reload`. Tabs show opencode's state
(working, waiting for you, done) without any extra setup.

### Abbreviations

Fish abbreviations expand inline when you press space. Run `abbr` to list all.

| Prefix | Expands to |
|---|---|
| `g…` | git: `gs` status, `ga`/`gaa` add, `gcm` commit -m, `gp`/`gpf` push, `gl` pull, `gd`/`gds` diff, `gsw`/`gswc` switch, `glog`, `gst`/`gstp` stash |
| `dd…` | ddev: `dds` start, `ddx` stop, `ddr` restart, `ddsh` ssh, `ddc` craft, `ddci`/`ddcu`/`ddciu`, `ddcq` queue, `ddim`/`ddex` db import/export |
| `db…` / `dpc` | devbox: `dbx`, `dpc` php craft, `dbc` composer, `dbn` npm, `dbp` pnpm |
| `dc…` | docker compose: `dc`, `dcu` up -d, `dcd` down, `dcl` logs -f; `dps` docker ps |
| `b…` / `cz…` | brew (`bi`, `bs`, `bu`), chezmoi (`czd`, `cza`, `cze`) |
| `up` | `topgrade`: update brew, nvim plugins, npm/pnpm/composer globals, tldr pages and more |

Other tools: `gh dash` for a dashboard of your GitHub PRs and issues
([gh-dash](https://www.gh-dash.dev); gh extensions are listed in
[`.chezmoiscripts/run_onchange_after_gh-extensions.sh`](.chezmoiscripts/run_onchange_after_gh-extensions.sh)),
`tldr <cmd>` for quick examples, `dust` for disk usage per
folder, `duf` for disk overview, `spf` for superfile (vim-style keys: `j/k` move,
`enter` open, `-` parent folder, `y/x/p` copy/cut/paste, `d` delete, `a` new,
`r` rename, `z` zoxide, `/` search, `q` close panel, `Q` quit and cd, `ctrl+c` quit,
`?` help).

Git diffs, `git log -p` and lazygit use [delta](https://github.com/dandavison/delta)
(`n`/`N` jumps between files in the pager).
