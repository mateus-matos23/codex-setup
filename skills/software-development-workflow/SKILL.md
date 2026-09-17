---
name: software-development-workflow
description: Plan and execute software changes through small validated slices, selecting only the context, tools, and model effort needed for the task.
---

# Software development workflow

Use this skill as the entry point for feature work, bug fixes, refactors and
other code changes. Read only the relevant section of
[quality-gates.md](references/quality-gates.md): `Definition of Ready` and
`Slice plan` before editing, `Slice gate` after each slice, `Definition of Done`
at the end. Read [economy.md](references/economy.md) only when choosing models
or subagents. When
routing is unclear, read [skill-routing.md](references/skill-routing.md). Load
at most one specialized skill initially and add another only for a distinct,
evidenced risk; do not load every available skill.

When the validation layer is unclear, read
[test-strategy.md](references/test-strategy.md) instead of loading unrelated
testing guidance.

## 1. Classify before editing

- Identify whether the request is a feature, bug, refactor, review, contract or
  data change, or operational change.
- State the routing decision briefly: use the primary workflow alone or name
  the one specialized skill that is actually needed. Do not list every skill
  considered.
- Read the repository instructions, current worktree, relevant contracts,
  existing patterns and focused tests.
- Stop when an ambiguity can change data, a contract, security or observable
  behavior. Record low-impact assumptions briefly.
- Define the expected behavior and the smallest useful validation before
  changing code.

## 2. Plan only the necessary slices

For work with more than one meaningful step, write an ordered plan of small
vertical slices. Each slice must state its objective, dependency, affected
boundaries, validation and completion condition.

- Keep slices sequential when one depends on another.
- Keep each slice complete across the boundaries it changes: code, persistence,
  generated contracts, UI and tests when applicable.
- Do not create speculative abstractions, fields, dependencies or cleanup.
- When delegation is being considered, read
  [subagent-policy.md](references/subagent-policy.md).

## 3. Implement and gate each slice

- Implement one slice at a time.
- Reuse existing helpers and project commands.
- After each slice, inspect the diff and run the smallest relevant checks.
- Check correctness, testability, readability, input validation, authorization,
  error handling, traceable logs and concrete performance risks when relevant.
- Do not start a dependent slice while a concrete failure, contract mismatch,
  security issue or unexplained regression remains.

## 4. Spend model and context deliberately

Apply [economy.md](references/economy.md) when choosing model, effort or
delegation. Do not spend higher effort to compensate for missing context.

## 5. Finish with evidence

Before reporting completion:

- read [final-report.md](references/final-report.md) and follow its checklist.

Do not claim completion when a concrete validation failure is unclassified.
