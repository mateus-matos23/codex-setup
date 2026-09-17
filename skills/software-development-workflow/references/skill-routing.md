# Skill routing

Use `software-development-workflow` as the automatic entry point for software
changes. Read or invoke only the smallest specialized skill required by the
request. Start with one specialist; add another only when a distinct risk is
actually present.

| Situation | Specialist | Do not load it for |
| --- | --- | --- |
| Bug, regression, failing test or unexpected behavior | `diagnose-before-fix` | Planned feature work without a failure |
| Explicitly focused refactor for readability or coupling | `readable-code` | Ordinary implementation already covered by the global principles |
| Concrete performance concern or performance-sensitive design | `performance-aware-development` | Generic code changes without a performance signal |
| Input, authentication, authorization, secrets, security or resilience | `secure-application-development` | Changes with no security boundary |
| Pull request, patch or diff review | `focused-code-review` | Implementation before a review is requested |
| Branch, history, commit or publish operation | `safe-git-workflow` | Normal file editing |
| API, persistence, migration, generated client or data contract | `contract-and-data-changes` | Changes isolated to local behavior |
| Unknown repository setup or missing commands | `project-context` | A project whose instructions and commands are already known |

`incremental-implementation` is retained as an explicit legacy specialist. The
main workflow already includes its sequential-slice behavior, so do not load
both unless the task specifically needs its standalone instructions.

Do not load every row for a single request. If no row applies, use the primary
workflow and repository instructions only. In the plan or status update, report
the selected route in one line, for example:

```text
Roteamento: workflow principal + performance-aware-development.
Motivo: a tarefa contém uma regressão concreta de query.
```
