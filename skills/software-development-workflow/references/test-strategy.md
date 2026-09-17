# Test strategy

Read this reference only when the appropriate validation layer is unclear.
Prefer the smallest check that can prove the changed behavior, then expand when
the change crosses a boundary or the evidence is insufficient.

| Change | Minimum useful validation |
| --- | --- |
| Pure function or domain rule | Unit test with normal, boundary and invalid cases |
| HTTP or RPC endpoint | Integration or contract test with success, validation, authorization and error cases |
| Persistence or migration | Schema/migration check, persistence test and compatibility with relevant old data |
| Generated client or OpenAPI | Regeneration plus consumer type/build and request/response contract checks |
| Import or batch job | Valid, invalid, duplicate, partial-failure and retry/idempotency cases |
| Frontend flow | Component or integration test for loading, empty, error, success and user interaction states |
| Performance-sensitive code | Focused correctness tests plus query, complexity, memory or render evidence |
| External integration | Timeout, dependency failure, safe retry, idempotency and traceable logging cases |
| Bug fix | A regression test that fails before the fix and passes after it |

Tests should assert observable behavior and meaningful contracts. Do not add
tests that merely preserve an implementation detail unless that detail is a
deliberate public contract.

## Escalation

- Start with the changed unit or module.
- Add integration or contract validation when a boundary is crossed.
- Add end-to-end validation when the user flow, authentication or browser
  integration is materially affected.
- Run broader suites when shared code, migrations, generated artifacts or
  cross-module behavior makes focused checks insufficient.

Classify infrastructure failures separately from product failures. Do not hide
an unexplained test failure by weakening the assertion or adding arbitrary
timeouts.
