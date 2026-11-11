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

2. **Set up 1Password.** Install the app and the CLI:

   ```sh
   brew install --cask 1password 1password-cli
   ```

   Sign in to the personal account (`my.1password.com`) and turn on **Settings ›
   Developer › Use the SSH agent** and **Integrate with 1Password CLI**. The
   terminal needs **Full Disk Access** (for Rex: **Rex Server**), or the CLI
   can't see the app.

   SSH logins and commit signing use the **Personal SSH key** item (Personal
   vault), so there's no key to create. When 1Password offers to edit
   `~/.ssh/config`, decline; chezmoi manages it. To authorize the key on a new
   server, add `~/.ssh/personal.pub` to its `~/.ssh/authorized_keys`.

3. **Install chezmoi and apply this repo.** `chezmoi init` prompts for git
   name/email and whether this is a personal or work Mac, then applies:

   ```sh
   brew install chezmoi
   chezmoi init --apply https://github.com/eirabben/dotfiles.git
   ```

   On `apply`, a chezmoi hook automatically runs `brew bundle` to install
   everything in the `Brewfile` (packages, casks, and fonts), plus
   `Brewfile.work` on a work Mac.

4. **Run the remaining one-time setup scripts** (in [`script/`](script/), not
   run automatically):

   ```sh
   ./script/change_shell.sh          # make fish the default shell
   ./script/set_computer_name.sh     # set the machine's hostname
   ```

   Then give opencode its secrets (see [Secrets for opencode](#secrets-for-opencode)).

## Day-to-day

```sh
chezmoi diff             # preview pending changes
chezmoi apply            # apply changes to the home directory
chezmoi edit <file>      # edit a managed file
chezmoi re-add           # pull external edits back into the source
```

To add a package, add it to the `Brewfile` (every Mac) or `Brewfile.work` (work
Mac only), then run `chezmoi apply` to install it:

```sh
brew bundle add --cask <name> --file ~/.local/share/chezmoi/Brewfile.work
```

Leave out `--cask` for command-line tools. Don't use `brew bundle dump`: it
merges everything into one file. Editing either file re-triggers the
`brew bundle` hook on the next `chezmoi apply`. It only installs: remove dropped
packages with `brew bundle remove` and `brew uninstall`.

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

### Secrets for opencode

Secrets for opencode's agents and MCP servers live in the **Agents** vault in
1Password.

MCP servers get theirs as environment variables of opencode's background
service, set once per Mac. They're stored in `~/.config/opencode/service.json`
(readable only by you, not part of this repo):

```sh
opencode service set env HA_MCP_URL (op read --account my.1password.com "op://Agents/Home Assistant MCP/credential")
```

Setting one stops the service; the next opencode starts it with the new value.
Use it in `opencode.jsonc` as `"{env:NAME}"`.

Agents read other secrets with `op read --account my.1password.com
"op://Agents/<item>/<field>"`, which asks you to approve in 1Password.

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
