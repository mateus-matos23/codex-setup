---
name: contract-and-data-changes
description: Plan and validate changes that cross API contracts, persistence, migrations, generated clients, imports, or shared data semantics.
---

# Contract and data changes

Use this skill only when a change affects an API contract, database schema,
migration, generated client, import/export, shared DTO, or persisted data.

## Establish the real contract

- Inspect the source contract, persistence mapping, generated artifacts and all
  relevant consumers before editing.
- Confirm field meaning, identity, nullability, ordering, pagination, errors,
  authorization and compatibility with existing records.
- Stop for decisions that could change data meaning, privacy, identity,
  aggregation, ownership or a public contract.
- Do not invent fields, endpoints, defaults or migration semantics.

## Plan the change

Split the work into dependent slices that keep every affected boundary aligned:

- schema or domain rule;
- migration and data transition;
- server behavior and validation;
- generated contract or client;
- consumers and UI;
- tests and documentation when applicable.

Choose the order that preserves a usable, testable system at each checkpoint.
Treat destructive or irreversible data operations as a separate risk decision.

## Validate before completion

- Run schema, migration and generated-artifact checks supplied by the project.
- Test new data, old data, nulls, duplicates, invalid input, authorization and
  compatibility boundaries that apply.
- Verify query shape, indexes, cardinality, pagination and transaction scope.
- Regenerate generated artifacts instead of editing them by hand.
- Report exactly which consumers and records were validated and which could not
  be checked.
