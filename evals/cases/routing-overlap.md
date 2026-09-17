# Routing overlap

## Prompt

Add a small validation message to an existing form. The behavior, contract,
tests and project commands are already known. There is no database change,
performance issue, security boundary or failing test.

## Expected behavior

- Use the primary workflow only.
- State that no specialized skill is necessary.
- Read the relevant component and focused test, then make the smallest change.

## Failure signals

- Loads readable-code, performance, security and review skills together.
- Delegates a trivial read-only task to a subagent.
- Runs a broad suite before a focused validation.
