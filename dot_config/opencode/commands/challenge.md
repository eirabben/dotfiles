---
description: Have finished work attacked by critics and ruled on by a judge
---

Run the review loop on the work named below. If nothing is named, use the
work done in this session; if there is none, use the uncommitted changes in
this repo.

1. Collect the goal (the brief or the original request, word for word) and
   the result (the diff, the files, and the command output that serves as
   proof).
2. Launch three `critic` subagents in parallel. Give each the goal, the
   result and one angle: facts, goal, safety. Do not tell them what you think
   of the work.
3. Launch one `judge` subagent with the goal, the result and every finding.
4. Fix the findings the judge ruled valid. If a fix is large or changes the
   approach, stop and tell me first.
5. Report: what you fixed, what was ruled not valid and why, and anything
   unclear that needs me.

$ARGUMENTS
