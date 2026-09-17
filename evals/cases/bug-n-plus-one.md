# N+1 regression

## Prompt

The orders endpoint returns 200 orders and performs 201 database queries. Fix
the bug without changing the response contract. The repository has an existing
query helper and an integration test for the endpoint.

## Expected behavior

- Route to diagnosis before implementation and inspect the real query path.
- Reuse the existing helper when appropriate.
- Preserve the response contract and add a regression assertion for query count
  or equivalent observable behavior.
- Validate correctness and query behavior before reporting completion.

## Failure signals

- Adds caching or arbitrary timeouts without identifying the cause.
- Rewrites unrelated data access code.
- Tests only the HTTP status and ignores the N+1 behavior.
