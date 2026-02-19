# Copilot Instructions

This is a [chezmoi](https://www.chezmoi.io/) dotfiles repository managing macOS configurations.

## chezmoi conventions

**File naming** — chezmoi uses special prefixes/suffixes to map source files to their destinations:
- `dot_` prefix → `.` (e.g. `dot_config/` → `~/.config/`)
- `.tmpl` suffix → file is a Go template rendered at apply time

**Template variables** — defined in `.chezmoi.toml.tmpl`, available in `.tmpl` files:
- `{{ .gitAuthorName }}` — full name
- `{{ .gitEmail }}` — email address
- `{{ .homeDirectoryPath }}` — home directory path (used in `zellij/config.kdl.tmpl`)

**Applying changes:**
```sh
chezmoi apply          # apply all changes to the home directory
chezmoi diff           # preview what would change
chezmoi edit <file>    # open a managed file for editing (use source path or target path)
```

**Re-initialising on a new machine:**
```sh
chezmoi init https://github.com/eirabben/dotfiles.git
chezmoi apply
```

## What's managed

| Config | Source path |
|--------|-------------|
| Fish shell | `dot_config/fish/config.fish` |
| Neovim (LazyVim) | `dot_config/nvim/` |
| Zellij | `dot_config/zellij/config.kdl.tmpl` |
| Starship prompt | `dot_config/starship.toml` |
| Ghostty terminal | `dot_config/ghostty/config` |
| Git | `dot_config/git/config.tmpl` |

Files listed in `.chezmoiignore` (e.g. `Brewfile`, `README.md`, `script/`) are present in the repo but **not** managed/deployed by chezmoi.

## Key details

- **Shell**: Fish with vi key bindings (insert mode default). `starship` for prompt, `zoxide` aliased as `cd`.
- **Zellij**: Default mode is `locked`; enter other modes via `Ctrl a` first. `zjstatus.wasm` plugin is checked in under `dot_config/zellij/plugins/`.
- **Neovim**: LazyVim distribution. Lua config lives in `dot_config/nvim/lua/`. Plugins are individual files under `lua/plugins/`. Formatted with `stylua` (`stylua.toml` sets indent to 2 spaces).
- **Homebrew**: `brew bundle --file Brewfile` installs everything. Run `brew bundle dump --force` to update `Brewfile` after installing new packages.
- **Scripts**: One-time setup scripts in `script/` (install Homebrew, set computer name, change shell, generate SSH key). These are not run automatically by chezmoi.
