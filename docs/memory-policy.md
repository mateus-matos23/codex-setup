# Memory policy

Use Codex memories for stable, reusable decisions and preferences, not as a
replacement for current repository evidence.

## Store

- durable coding preferences and communication preferences;
- confirmed domain decisions that are likely to recur;
- validated repository learnings with project, scope and date;
- recurring commands or failure diagnoses that remain useful.

## Do not store

- secrets, credentials, tokens, personal data or production records;
- temporary branch state, transient test output or unverified guesses;
- facts that are likely stale without identifying the repository and scope;
- a conclusion that should be rechecked against the current source or data.

## Use

- Treat memory as a hint and verify it against the current repository when the
  fact can affect code, data, security or observable behavior.
- Prefer a short, specific entry over a long transcript.
- When a decision changes, record the new decision and its scope rather than
  silently relying on the old one.
- Keep repository-wide principles in `AGENTS.md` or a skill; keep project
  incident details in the project's own documentation when they are needed by
  the team.
