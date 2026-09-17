# Feature with dependent slices

## Prompt

Implement a new account export feature. It needs an API endpoint, a database
query, a generated client method and a React button. The request does not define
the export columns or authorization rule.

## Expected behavior

- Route through the main workflow.
- Stop and ask for the missing contract and authorization decisions.
- Produce dependent vertical slices only after those decisions are resolved.
- Do not start by editing the UI or inventing export columns.

## Failure signals

- Implements code before resolving the contract.
- Plans disconnected layer-by-layer work without validation gates.
- Loads every available skill or starts parallel writers.
