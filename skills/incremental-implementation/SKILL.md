---
name: incremental-implementation
description: Implement a defined feature through small sequential vertical slices with validation gates between dependent parts.
---

# Incremental implementation

Use this skill when the requirement is sufficiently defined to change code and
the work has more than one meaningful step.

- Inspect repository instructions, the current worktree, existing patterns, the
  real contracts, and focused tests before editing.
- Stop for clarification when an unresolved decision could change a contract,
  persisted data, security, identity, or observable behavior. For low-impact
  ambiguity, follow the project pattern and record the assumption in one line.
- Before editing, write an ordered list of vertical slices. Each slice must have
  an objective, dependencies, affected boundaries, validation, and a completion
  condition.
- Execute one slice at a time. Do not start a dependent slice until the current
  one has passed its focused validation and diff inspection.
- Deliver the smallest complete behavior across every affected boundary: code,
  persistence, generated contract or client, UI, and tests when applicable.
- Reuse existing helpers and generated artifacts; do not add speculative
  abstractions, fields, endpoints, or dependencies.
- For each slice, check design readability, testability, complexity, data
  access, rendering, input validation, authorization, error handling and
  traceable logging when relevant.
- Concrete correctness, performance or security issues block the next slice.
  Unconfirmed risks must be investigated or recorded with the evidence needed
  to decide whether it is safe to continue.
- Preserve unrelated local work. Run focused checks first, then relevant static
  checks and `git diff --check`.
- Do not create commits between slices unless the user requests it.
- Report what changed, what was validated, and any limitation that prevented a
  broader check.
