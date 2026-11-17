---
name: pr-changelog
description: Write a short bullet point changelog in Norwegian for the current git branch, ready to paste into a pull request description. Use when the user asks for a changelog, a list of changes, or a PR description summary in Norwegian. Read-only; compares the branch against its base branch.
---

# PR changelog

Write a short changelog in Norwegian (bokmål) of what the current branch changes, as a bullet list the user can paste straight into a PR description. This skill only reads; it never changes files, commits or PRs.

## 1. Find the base branch

Use the first that applies:

1. The base branch the user named.
2. The base of an open PR for this branch: `gh pr view --json baseRefName -q .baseRefName` (skip if `gh` fails or there is no PR).
3. `main`, or `master` if `main` doesn't exist. Prefer `origin/<branch>` when it exists, so a stale local branch doesn't add unrelated changes.

Then `base=$(git merge-base HEAD <base branch>)`.

## 2. Read the changes

```bash
git log --oneline --no-merges $base..HEAD
git diff --stat $base..HEAD
git diff $base..HEAD
```

For a large diff, read the stat first, then the diff per file or folder. Commit messages help with intent, but the diff is the truth: describe what the code does now, not what a commit message claims.

If there are uncommitted changes (`git status --short`), leave them out, and say so in one line below the changelog.

## 3. Write the changelog

- Norwegian bokmål, one change per bullet, `-` as the bullet marker.
- Usually 2 to 8 bullets. Fewer for a small branch; never pad. Group small related edits into one bullet.
- Each bullet is one short line, starts with a capital letter, has no full stop at the end, and starts with what happened: `Legger til`, `Fikser`, `Endrer`, `Fjerner`, `Oppdaterer`, `Flytter`, `Rydder i`.
- Most important change first. Bug fixes and user-facing changes before refactoring and housekeeping.
- Write for the reviewer: say what changed and where, in plain words. Use code names (`classes`, files, handles) in backticks only when they help the reviewer find the change.
- Leave out noise: formatting, lockfile churn and generated files, unless that is the whole point of the branch. Mention dependency updates in one bullet (`Oppdaterer avhengigheter (...)`) when they matter.
- No headings, no intro sentence, no summary at the end, no issue numbers you can't see in the branch name or commits.

## Output

Return only the changelog in a fenced `markdown` code block, so it can be copied as is. Below the block, add at most one line with anything the user should know (uncommitted changes left out, base branch guessed). Nothing else.

Example:

```markdown
- Legger til filtrering på kategori i arkivet for nyheter
- Fikser at bildetekster forsvant i bildekarusellen på mobil
- Flytter oppsettet for søk til en egen modul
- Oppdaterer avhengigheter (Vite 7, Tailwind 4.2)
```
