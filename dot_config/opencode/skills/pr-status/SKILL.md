---
name: pr-status
description: Check the user's open pull requests in the current repository and say which ones need work. Use when the user asks about the status of their PRs, which PRs need attention, requested changes, unanswered review comments, merge conflicts or failing checks. Read-only; uses the gh CLI with the active account.
---

# PR status

Find out which of the user's open PRs in the current repository need work, and what to do next for each. This skill only reads; it never changes a PR, a branch or the working tree.

## Ground rules

- Use `gh` with the active account. Do not switch accounts.
- Only look at the repository of the current folder (`gh repo view`), and only PRs authored by the active user.
- Do not post, approve, merge, rerun checks, check out branches or edit files. If the user wants to act on a PR, point to the next step (see the end).

## 1. Fetch all open PRs in one query

```bash
repo=$(gh repo view --json nameWithOwner -q .nameWithOwner)
gh api graphql -f q="repo:$repo is:pr is:open author:@me" -f query='
query($q: String!) {
  viewer { login }
  search(query: $q, type: ISSUE, first: 50) {
    nodes {
      ... on PullRequest {
        number title url headRefName baseRefName isDraft updatedAt
        reviewDecision mergeable mergeStateStatus
        reviewRequests(first: 10) { nodes { requestedReviewer { ... on User { login } ... on Team { name } } } }
        latestReviews(first: 20) { nodes { author { login } state body submittedAt } }
        reviewThreads(first: 100) { nodes { isResolved isOutdated path line comments(last: 1) { nodes { author { login } createdAt } } } }
        comments(last: 10) { nodes { author { login } body createdAt } }
        commits(last: 1) { nodes { commit { committedDate statusCheckRollup { state contexts(first: 50) { nodes {
          ... on CheckRun { name status conclusion detailsUrl checkSuite { workflowRun { workflow { name } } } }
          ... on StatusContext { context state targetUrl }
        } } } } } }
      }
    }
  }
}'
```

If `mergeable` is `UNKNOWN`, GitHub is still computing it. Wait a few seconds and query that PR again (`gh pr view <n> --json mergeable,mergeStateStatus`) before reporting it as unknown.

## 2. Find out why checks fail

A failing job often runs several steps, so the job name alone does not say what broke. For each failing check run (`conclusion` is `FAILURE`, `TIMED_OUT` or `STARTUP_FAILURE`), take the job ID from `detailsUrl` (`.../job/<id>`) and list the failed steps:

```bash
gh api "repos/{owner}/{repo}/actions/jobs/<id>" --jq '.steps[] | select(.conclusion == "failure") | .name'
```

Check the project's instructions (`AGENTS.md`, `CLAUDE.md`) for failures that are known and should be ignored. Ignore a failing check only when **every** failed step in it matches; a real lint or test failure in the same job still counts. Mention ignored failures in one line at the end, not per PR.

Other check results that are not a pass:

- `CANCELLED`: not a code failure. Report it separately ("check cancelled"), and say whether a newer run of the same check exists; if not, the check has to be rerun before the PR counts as green.
- `ACTION_REQUIRED`: someone must approve or act on the run in GitHub (for example a workflow waiting for approval). Report it as needing the user, with the check's URL.
- Status still `IN_PROGRESS`, `QUEUED` or `PENDING`: report it as running, not as passed or failed.

## 3. Decide what needs work

A PR needs work when any of these hold:

| Signal | Means |
| --- | --- |
| `reviewDecision == CHANGES_REQUESTED` | A reviewer requested changes. Name the reviewer. |
| Unresolved review thread whose last comment is not by the viewer | A comment is waiting for an answer or a fix. |
| `latestReviews` with state `COMMENTED` or `CHANGES_REQUESTED` and a non-empty body, submitted after the last commit | Feedback in the review summary that has not been addressed yet. |
| PR comments by others after the last commit and after the viewer's last comment | Possibly a question or request. Read it before counting it; skip bots and plain notifications. |
| `mergeable == CONFLICTING` or `mergeStateStatus == DIRTY` | Merge conflicts with the base branch. |
| `mergeStateStatus == BEHIND` | The branch must be updated with the base branch before merging. |
| Failing checks not ignored by step 2 | CI is broken on this PR. Give the check and failed step names. |

Not work for the user, but useful to show:

- Approved, no conflicts and no real failures: ready to merge.
- Waiting for review: requested reviewers, no reviews yet.
- Draft PRs: show them, marked as draft.

Read the actual review bodies and unresolved comments so the summary says what is asked for, in a few words, instead of only "has comments".

## 4. Report

Start with a table, PRs that need work first:

| PR | Branch | Status | Needs |
| --- | --- | --- | --- |
| #123 | `feature-x` | Changes requested (reviewer) | Short description of what is asked |

Then, for each PR that needs work, a few lines with the details: the reviewer's requests in short form, the unresolved threads (file and topic), the conflicting base branch, or the failing step.

End with the next step for each PR that needs work:

- Review feedback: run `/pr-fix <number>` (the `fix-pr-review` skill).
- Merge conflicts or behind base: rebase on the base branch (`git fetch && git rebase origin/<base>`), then `/conflicts` if it stops on conflicts. Only suggest this; do not run it.
- Failing checks: name the failed step and offer to look into it.
