# Global instructions

## Eirik's repos

Two repos describe the setup you are working in. They apply in every project.

- `~/.local/share/chezmoi` (dotfiles): how this Mac and you are set up. These
  instructions, the Opencode config, SSH and the shell come from there. Change
  the source there, never the generated files in `~`.
- `~/Code/Repos/homelab`: Eirik's servers (`homeserver`, `vps`), what runs on
  them, the decisions made and the roadmap. Read its `AGENTS.md` before you
  touch either server from any project; its rules apply everywhere.

When Eirik asks for advice on tools, setup or workflow, read both `AGENTS.md`
files first.

## Checking work

- Never judge your own work. Proof is command output or a test. Saying that
  something works is not proof.
- Before reporting anything larger than a small edit as done, run the review
  loop: three `critic` subagents (angles: facts, goal, safety), then one
  `judge` with their findings. Fix what the judge rules valid. `/challenge`
  does the same on request.
- In the final report, list the findings that were ruled not valid, with the
  judge's reason.

## Secrets

- Secrets for agents (API tokens and the like) are in the **Agents** vault of
  Eirik's personal 1Password account. Read them with:
  `op read --account my.1password.com "op://Agents/<item>/<field>"`
- Only read from the Agents vault. If a secret isn't there, ask Eirik instead of
  searching other vaults.
- `op` asks Eirik to approve in 1Password. Say why you need the secret before
  running it.
- Never print, log, commit or write a secret to a file. Pass it straight to the
  command that needs it, e.g. `TOKEN=$(op read …) some-command`.
