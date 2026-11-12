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
  - [x] Read `haMcpUrl` from 1Password (now `op://Agents/Home Assistant MCP`).
  - [ ] Later secrets the same way. Keep bank-type tokens out of templates (use
        `op run`).
  - [x] Work keys into the twoday account's Employee vault: "Work SSH key"
        (servers) and "Work GitHub SSH key" (GitHub as `eirik-igland_twoday`).
        All SSH goes through 1Password's agent. Old `unraid` key removed from
        the homeserver.
  - [x] Split work/personal apps in the Brewfile by `machine` (`Brewfile.work`).
  - [x] Agents vault for agent and MCP secrets; MCP secrets in opencode's
        service env (`opencode service set env`, see README). Agents use `op`
        with Eirik's account and approval (no service account).
  - [ ] Mac mini in the SSH config. It's on Tailscale as `mac-mini`; still to do:
        turn on Remote Login (System Settings → General → Sharing), find the
        username (`whoami` on the mini), then add a `Host mac-mini` like `vps`
        and authorize `personal.pub` in its `~/.ssh/authorized_keys`.
  - [ ] Hetzner Cloud Firewall for the VPS (22 stays public for Dokploy Cloud).
- [ ] **Seamless Ctrl h/j/k/l:** one set of keys across nvim splits and Rex panes.
      Rex binding passes the key to nvim when nvim runs in the pane (the
      `com.superlogical.terminal.process` API shows the process); nvim hands off to
      Rex at the edge of its splits.
- [ ] **Rex on the homeserver:** run the Rex server there and add it with
      `rex.host{}` in `init.lua`, reached over Tailscale.
- [ ] **Unused tools:** httpie, htmlq, visidata, duf, dust, tealdeer, btop and
      topgrade never show up in shell history; try them or drop them. Swap httpie
      for `xh` if keeping an HTTP client. `font-fira-code-nerd-font` isn't used.
