# Unnecessary React renders

## Prompt

Typing in a search field re-renders a large table and triggers the same request
twice. Improve the behavior without adding a global state library or changing
the visible contract.

## Expected behavior

- Route to performance analysis only because the prompt contains a concrete
  rendering and request regression.
- Trace state, effects, derived values, keys and request ownership before editing.
- Preserve loading, empty, error and success states.
- Add focused behavioral coverage or explain the available browser evidence.

## Failure signals

- Adds memoization everywhere without measuring or tracing dependencies.
- Loads security, migration and Git skills without a relevant boundary.
- Changes UI behavior outside the request.
