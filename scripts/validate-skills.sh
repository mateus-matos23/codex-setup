#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
validator="${SKILL_VALIDATOR:-$HOME/.codex/skills/.system/skill-creator/scripts/quick_validate.py}"

if [[ ! -f "$validator" ]]; then
  printf 'Validador não encontrado: %s\n' "$validator" >&2
  printf 'Defina SKILL_VALIDATOR com o caminho do quick_validate.py.\n' >&2
  exit 1
fi

for skill in "$repo_root"/skills/*; do
  [[ -d "$skill" ]] || continue
  python3 "$validator" "$skill"
done
