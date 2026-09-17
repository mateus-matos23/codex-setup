# Quality gates

Use this reference with `software-development-workflow`. Keep the plan short;
the goal is to expose missing decisions, not to produce ceremony.

## Definition of Ready

A task is ready to implement when:

- the desired behavior and the out-of-scope behavior are clear;
- relevant repository instructions, consumers and existing patterns are known;
- contract, data, security or identity ambiguities are resolved;
- affected boundaries and dependencies are identified;
- the first validation and the important edge cases are known;
- the implementation can start without inventing fields, endpoints, data or
  dependencies.

If one of these is missing, either investigate it or stop for a decision. Do
not turn an unresolved product or contract decision into an implementation
assumption.

## Slice plan

Use this compact format before editing:

```text
1. Objective:
   Depends on:
   Boundaries:
   Validation:
   Complete when:
```

Keep the list ordered by dependency. A slice should deliver a testable part of
the behavior, not only a layer such as "create the service" or "add the UI".

## Slice gate

Before moving to the next dependent slice, confirm only the applicable items:

- behavior and contract match the requirement;
- focused tests cover the normal path and relevant edge/error cases;
- typecheck, lint or format checks pass when supplied by the project;
- database queries, I/O, algorithmic complexity and React renders have no
  concrete avoidable regression;
- external input, authorization, errors and logs are handled safely;
- generated artifacts and consumers remain synchronized;
- the diff contains no unrelated change.

If a check cannot run, record why and whether that blocks the slice. A command
that fails because of the environment is not evidence that the code is correct;
it is also not automatically a code failure.

## Definition of Done

A task is done when:

- the requested behavior works through every affected boundary;
- tests and regression coverage are present for changed logic;
- security, performance and operational risks were checked proportionally;
- the final diff and untracked files were inspected;
- relevant validation commands and their results are known;
- limitations, assumptions and unresolved non-blocking follow-ups are explicit.
