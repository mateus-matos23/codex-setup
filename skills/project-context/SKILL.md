---
name: project-context
description: Map an unfamiliar repository's stack, commands, services, generated artifacts, and validation workflow without changing application code.
---

# Project context

Use this skill before implementation when the repository setup, commands or
affected boundaries are unknown. Keep the investigation read-only and concise.

Inspect only the likely sources of truth:

- repository instructions and README files;
- package, build, lockfile and workspace manifests;
- CI, Docker and compose files when relevant;
- test, lint, typecheck, migration and generation scripts;
- generated-code markers and environment examples.

Return a compact context report with:

- stack and entry points;
- relevant commands, including prerequisites;
- test layers and the smallest useful check;
- required services, databases or environment variables;
- generated artifacts and files that must not be edited manually;
- constraints, unknowns and the next evidence needed.

Do not scan the whole repository, expose secrets, run destructive commands or
infer undocumented business rules. Prefer an existing project command over a
new command suggestion.
