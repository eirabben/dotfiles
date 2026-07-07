# AGENTS.md

macOS dotfiles managed by **chezmoi**. The source of truth is this repo; chezmoi
renders it into `~` on `chezmoi apply`. Apple Silicon only (`/opt/homebrew`).

## The one thing to not get wrong

Files in `~/.config` are **generated**. Editing them directly is wrong — changes
are overwritten on the next `chezmoi apply`. Always edit the source here, then
apply. To pull an external edit (e.g. a tool rewrote a live config) back into the
source, use `chezmoi re-add` — do not hand-copy.

## Source naming (chezmoi)

- `dot_config/` → `~/.config/`. `dot_foo` → `~/.foo`.
- `*.tmpl` files are Go-templated at apply time. Templated files here:
  `dot_config/git/config.tmpl`, `dot_config/zellij/config.kdl.tmpl`,
  `.chezmoi.toml.tmpl`, and the brew hook.
- Template vars (set once at `chezmoi init` via prompts, defined in
  `.chezmoi.toml.tmpl`): `.gitAuthorName`, `.gitEmail`, `.homeDirectoryPath`.
- `.chezmoiignore` lists files kept in-repo but **not** deployed: `Brewfile`,
  `README.md`, `TODO.md`, `script/`. Adding a managed config? It must live under
  `dot_config/` and not match `.chezmoiignore`.

## Homebrew packages (non-obvious)

`.chezmoiscripts/run_onchange_before_install-packages.sh.tmpl` runs `brew bundle`
automatically on `chezmoi apply`, but **only when its rendered content changes**.
It embeds the Brewfile via `{{ include "Brewfile" }}`, so the trigger is editing
`Brewfile` itself — there is no separate hash. Editing the script's wrapper logic
also re-triggers it. The Brewfile is piped via stdin; it is never deployed to `~`.

Update the package list with: `brew bundle dump --force --file ~/.local/share/chezmoi/Brewfile`

## Verify changes

- `chezmoi diff` — preview what `apply` would change. Treat a clean diff as the
  pass condition after editing source files.
- `chezmoi apply` on this machine will run `brew bundle` if the Brewfile changed
  (can be slow) — don't run it casually just to test a config edit; use `diff`.

## Conventions

- Neovim is a LazyVim distro; Lua is formatted with **stylua** (2-space indent,
  column width 120 — see `dot_config/nvim/stylua.toml`). One plugin per file in
  `lua/plugins/`.
- `script/*.sh`: bootstrap `install_brew.sh` uses `#!/bin/bash` (runs before
  Homebrew exists); the others use `#!/usr/bin/env bash`. Keep this split.
- Empty-looking `lua/config/options.lua` / `autocmds.lua` are intentional LazyVim
  scaffold — keep them.
