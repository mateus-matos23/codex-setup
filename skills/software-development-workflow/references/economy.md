# Economy policy

Read this reference only when choosing a model, reasoning effort or subagent.

Use the least expensive model and effort that can make the decision reliably:

- Luna/low: targeted exploration, repetitive edits and mechanical checks.
- Terra/low or medium: routine implementation and focused validation.
- Sol/medium or high: ambiguous multi-step work, security, data, contracts or
  difficult reviews.
- Astra: only after the available models fail on a genuinely difficult task;
  never as the default.

If a result is incomplete, first check whether the requirement, files,
permissions and repository evidence are sufficient. Increasing reasoning does
not supply missing context.

Keep context economical:

- search narrowly and read relevant sections only;
- prefer concise summaries with paths and symbols over raw output;
- run focused tests before broad suites;
- avoid repeating established evidence;
- ask subagents for findings, not transcripts.
