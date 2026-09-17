---
name: safe-git-workflow
description: Plan or execute Git branch, history, commit, and publish operations while preserving unrelated work and remote safety.
---

# Safe Git workflow

Use this skill for branch creation, cherry-picks, rebases, resets, force pushes,
commits, or other operations that can alter shared Git history.

- Inspect status, worktrees, the current branch, recent decorated history, and
  relevant local and remote refs before acting.
- Preserve unrelated changes and do not assume an observed hash or remote ref is
  current after another Git operation.
- Treat creating a branch as reversible. Treat reset, rebase, deletion, and
  force-push as history changes that require explicit user authorization.
- Before any force push, re-check the remote and use `--force-with-lease` only
  when the user explicitly authorized rewriting that exact ref.
- Keep commit and publication scope explicit; do not bundle unrelated work.
- After the operation, report the resulting refs and any recovery or backup path.
