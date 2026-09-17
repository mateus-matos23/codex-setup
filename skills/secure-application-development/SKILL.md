---
name: secure-application-development
description: Build and review secure, resilient, and observable application flows with validated input and explicit error handling.
---

# Secure application development

Use this skill for endpoints, imports, authentication, authorization, uploads,
parsers, integrations, sensitive data, error handling, logging, or other changes
that cross a trust boundary.

- Treat all external input as untrusted. Validate it server-side for type,
  syntax, semantics, size, range, cardinality, and allowed values before use.
  Client-side validation is for user experience, not security.
- Apply the relevant OWASP Top 10 and ASVS controls. Prefer established,
  framework-supported protections, parameterized queries, contextual output
  encoding, secure parsers, least privilege, and defense in depth.
- Check authentication and authorization separately. Do not infer permission
  from authentication or from client-provided identifiers.
- Classify errors as input, domain, dependency, or unexpected failures. Handle
  each explicitly at the correct boundary.
- Return clear, safe messages without stack traces, SQL, paths, versions,
  credentials, tokens, or sensitive data. Keep diagnostic details server-side.
- Isolate failures in requests, records, and background jobs when safe. Preserve
  transactions and cleanup; do not continue with inconsistent state.
- Use structured logs with severity, operation, correlation or request ID,
  outcome, and safe context. Redact secrets and personal data, and make errors
  traceable across service boundaries.
- Treat concrete security, resilience, or observability defects as blocking.
  Investigate uncertain risks instead of dismissing them or adding silent
  fallbacks.

Read [references/security-baseline.md](references/security-baseline.md) when the
task needs the official security baseline or a specific OWASP control.
