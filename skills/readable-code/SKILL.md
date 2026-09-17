---
name: readable-code
description: Design or refactor code for low cognitive load, clear responsibilities, testability, and controlled coupling.
---

# Readable code

Use this skill when implementing, refactoring, or reviewing code where
legibility, cohesion, testability, or coupling matters.

- Describe each changed function and file in one sentence before deciding where
  responsibilities belong.
- Prefer names and explicit data flow that make the main path understandable
  without opening every helper.
- Keep control flow shallow and error paths visible. Extract a function only when
  its name reduces cognitive load, isolates an effect, or creates a useful test
  boundary.
- Keep files cohesive. Do not split trivial code or impose universal line-count
  limits just to satisfy a metric.
- Isolate database, network, filesystem, time, randomness, framework state, and
  other external effects behind clear boundaries when that improves testing.
- Avoid speculative abstractions, configuration, flexibility, and indirection.
- Preserve existing contracts and generated artifacts unless the task explicitly
  changes them.
- Prefer behavior-focused tests that exercise the public boundary and important
  edge cases.
