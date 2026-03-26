#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

check_contains() {
  local name="$1"
  local command="$2"
  local needle="$3"
  local output

  output="$(eval "$command")"
  if [[ "$output" != *"$needle"* ]]; then
    printf 'Missing expected help anchor for %s: %s\n' "$name" "$needle" >&2
    exit 1
  fi
}

check_absent() {
  local needle="$1"
  if rg -n --fixed-strings --glob '!LICENSE' --glob '!CHANGELOG.md' -- "$needle" "$ROOT_DIR"/SKILL.md "$ROOT_DIR"/README.md "$ROOT_DIR"/CONTRIBUTING.md "$ROOT_DIR"/references >/dev/null; then
    printf 'Found stale pattern in documentation: %s\n' "$needle" >&2
    exit 1
  fi
}

glab --version >/dev/null

check_contains "auth login" "glab auth login --help" "--hostname"
check_contains "mr create" "glab mr create --help" "--related-issue"
check_contains "mr merge" "glab mr merge --help" "--auto-merge"
check_contains "issue close" "glab issue close --help" "glab issue close 123"
check_contains "ci run" "glab ci run --help" "--variables-from"
check_contains "ci retry" "glab ci retry --help" "Retry a CI/CD job."
check_contains "ci cancel" "glab ci cancel --help" "pipeline <id>"
check_contains "ci view" "glab ci view --help" "--pipelineid"
check_contains "api" "glab api --help" "--paginate"

check_absent "glab mr create 123"
check_absent "--web=false"
check_absent "glab ci run -V"
check_absent "glab ci retry <pipeline-id>"
check_absent "glab ci cancel <pipeline-id>"
check_absent "glab issue close 456 -m"
check_absent "glab pipeline ci view <pipeline-id>"

printf 'Verified glab documentation anchors against %s\n' "$(glab --version | head -n1)"
