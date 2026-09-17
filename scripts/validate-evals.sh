#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
eval_dir="$repo_root/evals/cases"
failures=0

for case_file in "$eval_dir"/*.md; do
  [[ -e "$case_file" ]] || continue

  for heading in "## Prompt" "## Expected behavior" "## Failure signals"; do
    if ! rg -q -F "$heading" "$case_file"; then
      printf 'fail    %s: seção ausente: %s\n' "$case_file" "$heading" >&2
      failures=$((failures + 1))
    fi
  done
done

if [[ "$failures" -gt 0 ]]; then
  printf '%d caso(s) de avaliação inválido(s).\n' "$failures" >&2
  exit 1
fi

printf 'Casos de avaliação válidos.\n'
