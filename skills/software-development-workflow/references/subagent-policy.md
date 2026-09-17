# Subagent policy

Read this reference only when delegation is being considered.

- Use at most one subagent by default.
- Give it one bounded task with an explicit output format.
- Prefer read-only exploration, triage, test analysis or summarization.
- Do not run parallel writers in the same worktree or dependent slices.
- Keep the main agent responsible for decisions, sequencing and final review.
- Choose the model and effort for the subtask, not by copying the most expensive
  parent configuration.
- Do not delegate a task whose coordination cost exceeds its reading or
  reasoning benefit.
