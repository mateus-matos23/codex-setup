#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
user_home="${HOME:?HOME is not set}"
codex_home="${CODEX_HOME:-$user_home/.codex}"
user_skills_dir="$user_home/.agents/skills"
repo_only=false
failures=0

if [[ "${1:-}" == "--repo-only" ]]; then
  repo_only=true
elif [[ $# -gt 0 ]]; then
  printf 'Uso: %s [--repo-only]\n' "$0" >&2
  exit 2
fi

pass() {
  printf 'ok      %s\n' "$1"
}

warn() {
  printf 'warn    %s\n' "$1"
}

fail() {
  printf 'fail    %s\n' "$1" >&2
  failures=$((failures + 1))
}

check_file() {
  local path="$1"

  if [[ -f "$path" ]]; then
    pass "arquivo presente: $path"
  else
    fail "arquivo ausente: $path"
  fi
}

check_link() {
  local source="$1"
  local target="$2"
  local actual

  if [[ ! -L "$target" ]]; then
    fail "link ausente: $target"
    return
  fi

  actual="$(readlink -- "$target")"
  if [[ "$actual" == "$source" ]]; then
    pass "link correto: $target"
  else
    fail "link incorreto: $target -> $actual (esperado: $source)"
  fi
}

printf 'Verificando ia-docs em %s\n' "$repo_root"

check_file "$repo_root/AGENTS.md"
check_file "$repo_root/config.toml"
check_file "$repo_root/scripts/install.sh"
check_file "$repo_root/scripts/validate-skills.sh"
check_file "$repo_root/scripts/validate-evals.sh"

if python3 - "$repo_root/config.toml" <<'PY'
import sys
import tomllib

with open(sys.argv[1], "rb") as config_file:
    config = tomllib.load(config_file)

required = {
    "model": config.get("model"),
    "model_reasoning_effort": config.get("model_reasoning_effort"),
    "tool_output_token_limit": config.get("tool_output_token_limit"),
    "skills.max_context_tokens": config.get("skills", {}).get(
        "max_context_tokens"
    ),
    "agents.max_concurrent_threads_per_session": config.get("agents", {}).get(
        "max_concurrent_threads_per_session"
    ),
}

missing = [name for name, value in required.items() if value in (None, "")]
if missing:
    raise SystemExit("configuração ausente: " + ", ".join(missing))

if not isinstance(required["tool_output_token_limit"], int) or required[
    "tool_output_token_limit"
] <= 0:
    raise SystemExit("tool_output_token_limit deve ser um inteiro positivo")

if not isinstance(required["skills.max_context_tokens"], int) or required[
    "skills.max_context_tokens"
] <= 0:
    raise SystemExit("skills.max_context_tokens deve ser um inteiro positivo")

print(
    "configuração: model=%s effort=%s output_limit=%s skill_catalog=%s max_agents=%s"
    % tuple(required.values())
)
PY
then
  pass "config.toml é TOML válido"
else
  fail "config.toml não é TOML válido"
fi

if [[ -x "$repo_root/scripts/validate-skills.sh" ]]; then
  if "$repo_root/scripts/validate-skills.sh"; then
    pass "skills válidas"
  else
    fail "validação das skills falhou"
  fi
else
  fail "script sem permissão de execução: $repo_root/scripts/validate-skills.sh"
fi

if [[ -x "$repo_root/scripts/validate-evals.sh" ]]; then
  if "$repo_root/scripts/validate-evals.sh"; then
    pass "casos de avaliação válidos"
  else
    fail "validação dos casos de avaliação falhou"
  fi
else
  fail "script sem permissão de execução: $repo_root/scripts/validate-evals.sh"
fi

if command -v codex >/dev/null 2>&1; then
  pass "Codex disponível: $(codex --version 2>/dev/null || printf 'versão indisponível')"
else
  warn "Codex não encontrado no PATH; instalação pode ser concluída fora deste shell"
fi

if [[ "$repo_only" == true ]]; then
  printf 'Modo repo-only: verificações de links foram ignoradas.\n'
else
  check_link "$repo_root/config.toml" "$codex_home/config.toml"
  check_link "$repo_root/AGENTS.md" "$codex_home/AGENTS.md"

  for profile in "$repo_root"/profiles/*.config.toml; do
    [[ -e "$profile" ]] || continue
    check_link "$profile" "$codex_home/$(basename -- "$profile")"

    if [[ "$profile" == *.local.config.toml ]]; then
      profile_name="$(basename -- "$profile" .config.toml)"
      printf 'profile  use: codex --profile %s\n' "$profile_name"
    fi
  done

  for skill in "$repo_root"/skills/*; do
    [[ -d "$skill" ]] || continue
    check_link "$skill" "$user_skills_dir/$(basename -- "$skill")"
  done
fi

if (( failures > 0 )); then
  printf '%d verificação(ões) falharam.\n' "$failures" >&2
  exit 1
fi

printf 'Diagnóstico concluído sem falhas.\n'
