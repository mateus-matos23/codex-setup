---
name: diagnose-before-fix
description: Diagnose bugs, regressions, failing tests, or unexpected behavior before proposing or implementing a fix.
---

# Diagnose before fix

Use this skill when the task reports a defect, regression, flaky or failing test,
unexpected output, or an error whose cause is not yet established.

- Reproduce or localize the behavior using the supplied error, input, record, or
  test before changing code.
- Trace the relevant data and control flow until the first incorrect assumption,
  transformation, or boundary is identified.
- Separate product defects from environment failures, stale generated artifacts,
  pre-existing worktree changes, and incomplete test infrastructure.
- State the root cause with concrete evidence, then propose the smallest fix and
  the regression cases it must cover.
- If the user asked only for diagnosis, do not implement the fix.
- Do not hide invalid input or infrastructure failures behind generic catches or
  silent fallbacks.
