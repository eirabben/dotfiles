# AGENTS.md

macOS dotfiles managed by **chezmoi**. The source of truth is this repo; chezmoi
renders it into `~` on `chezmoi apply`. Apple Silicon only (`/opt/homebrew`).

## Related repos

| Repo | Path on the Macs | Owns |
|---|---|---|
| `dotfiles` (this one) | `~/.local/share/chezmoi` | How the Macs and the agents are set up: shell, SSH config, Opencode config, global agent instructions, MCP servers, environment variables. |
| `homelab` | `~/Code/Repos/homelab` | Servers, services, network, runbooks, the roadmap and the task briefs. Its `AGENTS.md` describes how agents work on tasks (briefs, gates, review). |

- Read the homelab `AGENTS.md` and `docs/decisions.md` before recommending a
  change to agent setup or workflow, so the setup here serves how work is done
  there.
- Anything about a server belongs in homelab. This repo only holds the client
  side: the SSH host entry, the key, the environment variable.
- Planned work is tracked in homelab's `docs/roadmap.md`. `TODO.md` here is for
  dotfiles-only items; do not track server work in it.

## The one thing to not get wrong

Files in `~/.config` are **generated**. Editing them directly is wrong — changes
are overwritten on the next `chezmoi apply`. Always edit the source here, then
apply. To pull an external edit (e.g. a tool rewrote a live config) back into the
source, use `chezmoi re-add` — do not hand-copy.

## Source naming (chezmoi)

- `dot_config/` → `~/.config/`. `dot_foo` → `~/.foo`.
- `*.tmpl` files are Go-templated at apply time. Templated files here:
  `dot_config/git/config.tmpl`, `dot_config/git/allowed_signers.tmpl`,
  `.chezmoi.toml.tmpl` and the brew hook.
- Template vars (set once at `chezmoi init` via prompts, defined in
  `.chezmoi.toml.tmpl`): `.gitAuthorName`, `.gitEmail`,
  `.machine` (`personal` or `work`; gates per-machine apps and secrets).
- Secrets never go in the repo, in prompts or in rendered files. Secrets opencode
  needs (MCP servers, API tokens for agents) live in the **Agents** vault of the
  personal 1Password account (`my.1password.com`). MCP secrets reach opencode's
  config as environment variables set per Mac with `opencode service set env
  NAME VALUE` (stored in `~/.config/opencode/service.json`, which must never be
  added to this repo); config uses `"{env:NAME}"`. How agents read secrets is in
  the global instructions, `dot_config/opencode/AGENTS.md`.
- `.chezmoiignore` lists files kept in-repo but **not** deployed: `Brewfile`,
  `Brewfile.*`, `README.md`, `TODO.md`, `script/`. Adding a managed config? It
  must live under `dot_config/` (SSH: `private_dot_ssh/`) and not match
  `.chezmoiignore`.
- Removing a managed config? Deleting it from the source leaves the deployed
  copy in `~`. Also list its target path in `.chezmoiremove`.

## Homebrew packages (non-obvious)

`.chezmoiscripts/run_onchange_before_install-packages.sh.tmpl` runs `brew bundle`
automatically on `chezmoi apply`, but **only when its rendered content changes**.
It embeds `Brewfile` plus `Brewfile.<machine>` (if it exists; e.g.
`Brewfile.work`) via `include`, so the trigger is editing either file — there is
no separate hash. Editing the script's wrapper logic also re-triggers it. The
Brewfiles are piped via stdin; they are never deployed to `~`.

Packages for every Mac go in `Brewfile`; work-only ones in `Brewfile.work`.
Never `brew bundle dump` over them: it merges everything into one file and drops
the split and comments. Add or remove entries with
`brew bundle add|remove [--cask] <name> --file <Brewfile>`, or by hand.

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
