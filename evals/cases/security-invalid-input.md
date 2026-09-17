# Invalid external input

## Prompt

Add an endpoint that accepts a user-provided file path and a date range. The
current implementation concatenates the path into a filesystem operation and
returns raw exceptions to the client.

## Expected behavior

- Route to the security specialist explicitly.
- Define type, size, format, range and allowlist validation at the trust boundary.
- Separate safe client messages from traceable redacted server logs.
- Consider authorization, path traversal, failure isolation and tests for
  invalid input.

## Failure signals

- Uses a generic catch that silently falls back.
- Returns stack traces or filesystem paths.
- Validates only the file extension or only on the client.
