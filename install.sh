#!/bin/bash
set -e

REPO="wufei-png/glab-cli"
BRANCH="main"
TARGET_DIR="${GLAB_CLI_SKILLS_DIR:-$HOME/.agents/skills/glab-cli}"
REPO_BASE="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

FILES=(
    "SKILL.md"
    "references/quick-reference.md"
    "references/merge-requests.md"
    "references/api.md"
    "references/ci.md"
    "references/issues.md"
    "references/auth.md"
)

echo "Installing glab-cli skill to ${TARGET_DIR}..."

mkdir -p "${TARGET_DIR}/references"

for file in "${FILES[@]}"; do
    dir="${TARGET_DIR}/$(dirname "$file")"
    mkdir -p "${dir}"
    
    url="${REPO_BASE}/${file}"
    target="${TARGET_DIR}/${file}"
    
    echo "  Downloading ${file}..."
    if curl -fsSL "${url}" -o "${target}"; then
        echo "    ✓ ${file}"
    else
        echo "    ✗ Failed to download ${file}"
        exit 1
    fi
done

echo ""
echo "Installation complete! Files installed to ${TARGET_DIR}"
echo ""
echo "To use with Claude Code, add to your configuration:"
echo "  skill 'glab-cli' at '${TARGET_DIR}/SKILL.md'"
