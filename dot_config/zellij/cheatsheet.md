# Zellij cheatsheet   (q to close)

Zellij starts in **locked** mode: keys go to the app.
`Ctrl a` enters normal mode. `Esc` / `Enter` goes back to locked.

## Always (locked mode)

| Keys            | Action                                        |
|-----------------|-----------------------------------------------|
| `Ctrl h/j/k/l`  | Move between nvim splits and panes (h/l wrap to tabs) |
| `Alt n`         | New pane                                      |
| `Alt f`         | Show/hide floating panes                      |
| `Alt i` / `o`   | Move tab left/right                           |
| `Alt + / -`     | Resize                                        |

## After `Ctrl a`

| Key   | Action                                                    |
|-------|-----------------------------------------------------------|
| `w`   | Switch project session (also brings back saved ones)      |
| `f`   | Fuzzy-find a tab                                          |
| `g`   | lazygit, floating                                         |
| `[ ]` | Cycle pane arrangements: side by side, rows, stacked      |
| `?`   | This cheatsheet                                           |
| `p`   | Pane mode                                                 |
| `t`   | Tab mode                                                  |
| `r`   | Resize mode                                               |
| `m`   | Move mode                                                 |
| `s`   | Scroll mode                                               |
| `o`   | Session mode                                              |

## Modes

| Mode   | Keys                                                                 |
|--------|----------------------------------------------------------------------|
| pane   | `n` new, `r` right, `d` down, `s` stacked, `x` close, `f` fullscreen, `w` floating, `e` float/embed, `c` rename |
| tab    | `n` new, `x` close, `r` rename, `1-9` go to, `b` break pane out, `[ ]` break pane left/right |
| resize | `h/j/k/l` grow, `H/J/K/L` shrink                                     |
| move   | `h/j/k/l` move pane                                                  |
| scroll | `f` search, `e` open scrollback in nvim, `c` copy last command output |
| session| `w` session manager, `d` detach, `l` layouts                         |

## Status bar (right side)

opencode state per project:  `●` working   `▲` waiting for you   `■` done   `×` error

## Shell

| Command          | Action                                             |
|------------------|----------------------------------------------------|
| `project`        | Open/switch to a project session for this folder   |
| `project <path>` | Same for a folder, or a zoxide query               |
