# Global instructions

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
