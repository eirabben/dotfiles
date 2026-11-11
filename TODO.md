# To Do

- [ ] **1Password** (this Mac is the work Mac; it has both the personal and work
      accounts). Don't touch the existing key files until Eirik says so.
  - [x] `machine` value (`personal`/`work`) in `.chezmoi.toml.tmpl`.
  - [x] Managed `~/.ssh/config`: `homeserver` (alias `unraid`) and `vps`, both by
        Tailscale name.
  - [x] Personal SSH key in 1Password ("Personal SSH key", personal account),
        public key in `private_dot_ssh/personal.pub`, used for `homeserver` and
        `vps`. Authorized on both.
  - [x] Sign commits with the personal key (`gpg.format ssh`, `op-ssh-sign`).
  - [x] Add the personal key to the `eirabben` GitHub account as a signing key.
  - [x] Read `haMcpUrl` from 1Password (`op://Personal/Home Assistant MCP`).
  - [ ] Later secrets the same way. Keep bank-type tokens out of templates (use
        `op run`).
  - [ ] Work keys (`id_ed25519`, `id_rsa`) into the work 1Password account, once
        IT has set it up.
  - [x] Split work/personal apps in the Brewfile by `machine` (`Brewfile.work`).
  - [ ] Agents vault with a read-only service account.
  - [ ] Tailscale on the Mac mini, then add it to the SSH config.
  - [ ] Hetzner Cloud Firewall for the VPS (22 stays public for Dokploy Cloud).
- [ ] **Seamless Ctrl h/j/k/l:** one set of keys across nvim splits and Rex panes.
      Rex binding passes the key to nvim when nvim runs in the pane (the
      `com.superlogical.terminal.process` API shows the process); nvim hands off to
      Rex at the edge of its splits.
- [ ] **atuin sync:** share shell history between Macs; self-host the sync server
      on the homeserver over Tailscale, or use atuin's encrypted cloud.
- [ ] **Rex on the homeserver:** run the Rex server there and add it with
      `rex.host{}` in `init.lua`, reached over Tailscale.
- [ ] **gh-dash:** Catppuccin Macchiato theme, and a key that opens a PR's repo in
      a new Rex tab with lazygit or nvim.
- [ ] **difftastic in lazygit:** add as a second diff renderer next to delta
      (cycle with `|`).
- [ ] **Unused tools:** httpie, htmlq, visidata, duf, dust, tealdeer, btop and
      topgrade never show up in shell history; try them or drop them. Swap httpie
      for `xh` if keeping an HTTP client. `font-fira-code-nerd-font` isn't used.
- [ ] **Rex font:** switch from JetBrains Mono to JetBrainsMono Nerd Font (in the
      Brewfile, and has the icons eza, yazi, superfile and starship use).
- [ ] **Node versions (maybe):** `mise` for per-project Node from `.nvmrc`, if
      devbox doesn't already cover it.
