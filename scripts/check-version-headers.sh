#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXPECTED_VERSION="glab $(tr -d '[:space:]' < "$ROOT_DIR/.glab-version")"

matches=()
while IFS= read -r match; do
  matches+=("$match")
done < <(
  rg -n -o --glob '!LICENSE' --glob '!CHANGELOG.md' -- 'glab [0-9]+\.[0-9]+\.[0-9]+' \
    "$ROOT_DIR"/SKILL.md \
    "$ROOT_DIR"/README.md \
    "$ROOT_DIR"/CONTRIBUTING.md \
    "$ROOT_DIR"/references || true
)

if [[ "${#matches[@]}" -eq 0 ]]; then
  printf 'No version markers found in documentation.\n' >&2
  exit 1
fi

status=0

for match in "${matches[@]}"; do
  version="${match##*:}"
  if [[ "$version" != "$EXPECTED_VERSION" ]]; then
    printf 'Mismatched documented version: %s\n' "$match" >&2
    status=1
  fi
done

if [[ "$status" -ne 0 ]]; then
  exit 1
fi

printf 'Verified documentation version markers against %s\n' "$EXPECTED_VERSION"
