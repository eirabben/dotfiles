---
name: fix-merge-conflicts
description: Resolve git merge conflicts in the working tree, typically in the middle of a git rebase (also merge, cherry-pick or revert). Use when the user asks to fix, resolve or handle merge conflicts, conflict markers, or a stopped rebase. Works out what both sides intended, resolves every conflicted file, verifies, stages, and stops so the user can continue the rebase.
---

# Fix Merge Conflicts

## When to use

The user is in the middle of a rebase (or merge, cherry-pick, revert) that stopped on conflicts and asks you to fix them. Usually this is a fresh session, so you have no prior context: rebuild it from git before editing anything.

## Ground rules

- **Never** run `git rebase --continue`, `--skip`, `--abort`, `git merge --abort`, `git commit`, `git reset`, `git stash` or `git push`. The user continues the operation themselves.
- Do not resolve by blindly taking one side for a whole file. Each hunk gets a decision based on what both sides intended.
- Preserve both sides' intent whenever they are compatible. When they truly contradict and the right answer is not clear from the code and history, ask the user instead of guessing.
- Only touch conflicted files, plus files that must change for the resolution to compile (for example a renamed function used elsewhere). Mention any such extra edits.

## 1. Figure out the state

```bash
git status
git diff --name-only --diff-filter=U
```

Detect the operation:

| Exists | Operation |
| --- | --- |
| `.git/rebase-merge/` or `.git/rebase-apply/` | rebase |
| `.git/MERGE_HEAD` | merge |
| `.git/CHERRY_PICK_HEAD` | cherry-pick |
| `.git/REVERT_HEAD` | revert |

Use `git rev-parse --git-path rebase-merge` etc. so this also works in worktrees.

For a rebase, collect context:

```bash
d=$(git rev-parse --git-path rebase-merge)
cat "$d/head-name" "$d/onto"           # branch being rebased, and what it is rebased onto
cat "$d/msgnum" "$d/end"               # progress: commit N of M
git log -1 --format='%h %s%n%n%b' REBASE_HEAD   # the commit being replayed
git show --stat REBASE_HEAD
```

### Which side is which (important)

| Operation | `ours` / stage 2 / `HEAD` | `theirs` / stage 3 |
| --- | --- | --- |
| rebase | the upstream/onto side plus already replayed commits | **the user's commit being replayed** (`REBASE_HEAD`) |
| merge | the user's current branch | the branch being merged in |
| cherry-pick / revert | the user's current branch | the picked / reverted commit |

In a rebase the labels feel backwards: `<<<<<<< HEAD` is upstream, `>>>>>>> <sha> (<message>)` is the user's own change. Get this right before deciding anything.

## 2. Understand both sides

For each conflicted file:

1. If the file has not been edited yet, recreate the markers with the common ancestor visible, which makes intent much clearer:
   ```bash
   git checkout --conflict=zdiff3 -- path/to/file
   ```
   (This discards any manual edits in that file, so only do it before you start resolving it.)
2. Look at what each side did relative to the base:
   ```bash
   git diff :1:path/to/file :2:path/to/file   # base -> ours
   git diff :1:path/to/file :3:path/to/file   # base -> theirs
   ```
3. Read the reason behind each side:
   - The commit being applied: `git show REBASE_HEAD -- path/to/file` (or `MERGE_HEAD`, `CHERRY_PICK_HEAD`).
   - The other side's changes to the file:
     ```bash
     base=$(git merge-base HEAD REBASE_HEAD)
     git log --oneline "$base"..HEAD -- path/to/file
     git log -p "$base"..HEAD -- path/to/file
     ```
4. Read enough of the surrounding file (and callers, if signatures changed) to understand the code, not just the hunk.

## 3. Resolve

Handle each hunk on its merits. Common patterns:

- **Independent additions** (both added imports, routes, list items, config keys): keep both, in a sensible order, without duplicates.
- **One side refactored, the other changed behaviour**: apply the behaviour change on top of the refactored code.
- **Renamed or moved symbol on one side, new usage on the other**: use the new name everywhere, including in non-conflicted parts of the user's commit if needed.
- **Same line changed differently**: combine if possible; if they contradict, prefer the side whose commit message shows that it is the deliberate change, otherwise ask.
- **Formatting-only change vs. real change**: keep the real change, written in the new formatting.

Special cases:

- **Modify/delete** (`deleted by us/them`): check why it was deleted (moved? replaced? obsolete?). If moved, port the modification to the new location and `git rm` the old path. If obsolete, `git rm` it and note that the change was dropped.
- **Rename conflicts / add-add**: compare both versions and merge into the path that should exist after this commit.
- **Lockfiles** (`package-lock.json`, `yarn.lock`, `pnpm-lock.yaml`, `composer.lock`, `Cargo.lock`, `go.sum`, `Gemfile.lock`, …): do not hand-merge. Resolve the manifest (`package.json`, `composer.json`, …) first, take the upstream lockfile (`git checkout --ours -- <lockfile>` during a rebase), then regenerate it with the project's package manager so the user's dependency changes are reapplied (for example `npm install --package-lock-only`, `composer update <changed packages>`, `pnpm install --lockfile-only`). Use the project's Docker/DDEV wrapper if it has one. If regenerating is not possible, tell the user.
- **Generated or built files** (compiled assets, `dist/`, generated types, snapshots): take one side and regenerate if there is a clear build command; otherwise take the upstream side and tell the user to rebuild.
- **Craft CMS project config** (`config/project/**/*.yaml`): merge the YAML by meaning (keep both sides' fields, entry types, settings). For `dateModified` in `project.yaml`, use the newer timestamp. Keep UIDs exactly as they are; never invent new ones.
- **Binary files**: cannot be merged. Ask which version to keep unless it is obvious.
- **Submodules**: report the two commits and ask.

## 4. Verify

```bash
rg -n '^(<<<<<<<|=======$|>>>>>>>|\|\|\|\|\|\|\|)' -- $(git diff --name-only --diff-filter=U)
git diff --check
```

No markers may remain. Then do a cheap sanity check on the touched files when the project has one: syntax check, lint, type check, or a quick related test. Do not run long full test suites unless the user asks. If a check fails because of the resolution, fix it.

## 5. Stage and stop

Stage only the resolved files (`git add <file>` or `git rm <file>` for deletions), then run `git status` to confirm nothing is left unmerged.

Do not continue the rebase. End with a short summary:

- Which commit was being applied (for a rebase: `N/M`, short sha and subject).
- Per file: one line on how it was resolved and why.
- Anything that needs the user's attention: dropped changes, guesses, regenerated lockfiles, failing checks, files you edited outside the conflict set.
- The next command for the user: `git rebase --continue` (or `git merge --continue`, `git cherry-pick --continue`, `git revert --continue`).
