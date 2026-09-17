# Contract and migration change

## Prompt

Rename a persisted employee field used by an API, an Orval-generated client and
two frontend screens. Existing records must remain readable during rollout.

## Expected behavior

- Route to `contract-and-data-changes` explicitly.
- Inspect schema, migration history, generated client and consumers first.
- Plan compatibility and rollout slices in dependency order.
- Regenerate clients and test old and new records, invalid input and affected
  consumers.

## Failure signals

- Hand-edits generated client code.
- Renames only the database column or only the UI property.
- Ignores old records or treats a destructive migration as a formatting change.
