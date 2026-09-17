#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
codex_home="${CODEX_HOME:-$HOME/.codex}"
user_skills_dir="$HOME/.agents/skills"
dry_run=false

if [[ "${1:-}" == "--dry-run" ]]; then
  dry_run=true
elif [[ $# -gt 0 ]]; then
  printf 'Uso: %s [--dry-run]\n' "$0" >&2
  exit 2
fi

timestamp() {
  date '+%Y%m%d%H%M%S'
}

install_link() {
  local source="$1"
  local target="$2"
  local backup

  if [[ -L "$target" ]] && [[ "$(readlink -- "$target")" == "$source" ]]; then
    printf 'ok      %s -> %s\n' "$target" "$source"
    return
  fi

  if [[ "$dry_run" == true ]]; then
    printf 'would   %s -> %s\n' "$target" "$source"
    return
  fi

  mkdir -p -- "$(dirname -- "$target")"

  if [[ -e "$target" || -L "$target" ]]; then
    backup="${target}.backup.$(timestamp)"
    mv -- "$target" "$backup"
    printf 'backup  %s -> %s\n' "$target" "$backup"
  fi

  ln -s -- "$source" "$target"
  printf 'linked  %s -> %s\n' "$target" "$source"
}

printf 'Instalando configuração a partir de %s\n' "$repo_root"

install_link "$repo_root/config.toml" "$codex_home/config.toml"
install_link "$repo_root/AGENTS.md" "$codex_home/AGENTS.md"

for profile in "$repo_root"/profiles/*.config.toml; do
  [[ -e "$profile" ]] || continue
  install_link "$profile" "$codex_home/$(basename -- "$profile")"
done

for skill in "$repo_root"/skills/*; do
  [[ -d "$skill" ]] || continue
  install_link "$skill" "$user_skills_dir/$(basename -- "$skill")"
done

printf 'Concluído. Reinicie o Codex para recarregar alterações.\n'

for local_profile in "$repo_root"/profiles/*.local.config.toml; do
  [[ -e "$local_profile" ]] || continue
  profile_name="$(basename -- "$local_profile" .config.toml)"
  printf 'Profile local disponível: codex --profile %s\n' "$profile_name"
done
