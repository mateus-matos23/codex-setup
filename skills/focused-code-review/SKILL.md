---
name: focused-code-review
description: Review a pull request, patch, or diff for correctness, security, regressions, and contract risks.
---

# Focused code review

Use this skill when the user asks to review a diff, pull request, patch, or
completed implementation.

- Establish the review scope and baseline before reading beyond the diff.
- Prioritize behavior that can be incorrect, regress, break a contract, expose
  data, or make future changes materially harder.
- Follow changed values through their main consumers and inspect edge cases,
  authorization, persistence, generated contracts, and meaningful tests.
- When relevant, inspect N+1 access, slow or oversized queries, data structures,
  Big O, memory, cyclomatic complexity, unnecessary React renders, input
  validation, OWASP risks, error exposure, recovery behavior, and log
  correlation.
- Report findings first, ordered by severity, with file locations, evidence, and
  a concrete failure scenario. Distinguish confirmed findings from questions.
- A concrete correctness, security, resilience or performance risk is a finding;
  an unmeasured hypothesis should identify the evidence or measurement needed.
- Do not rewrite code or turn style preferences into findings unless the user
  asks for implementation.
- If there are no relevant findings, say so explicitly and mention validation
  that was actually performed.
