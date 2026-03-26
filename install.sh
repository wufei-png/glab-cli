#!/bin/bash
set -e

REPO="wufei-png/glab-cli"
BRANCH="main"
TARGET_DIR="${GLAB_CLI_SKILLS_DIR:-$HOME/.agents/skills/glab-cli}"
RAW_BASE="https://raw.githubusercontent.com/${REPO}/${BRANCH}"
API_BASE="https://api.github.com/repos/${REPO}/contents"

download_file() {
    local file="$1"
    local dir="${TARGET_DIR}/$(dirname "$file")"
    mkdir -p "${dir}"
    
    local url="${RAW_BASE}/${file}"
    local target="${TARGET_DIR}/${file}"
    
    echo "  Downloading ${file}..."
    if curl -fsSL "${url}" -o "${target}"; then
        echo "    ✓ ${file}"
    else
        echo "    ✗ Failed to download ${file}"
        return 1
    fi
}

download_directory() {
    local dir_path="$1"
    echo "  Fetching directory listing: ${dir_path}..."
    
    local files
    files=$(curl -fsSL "${API_BASE}/${dir_path}?ref=${BRANCH}" | grep '"name"' | sed 's/.*"name": "\([^"]*\)".*/\1/')
    
    if [ -z "$files" ]; then
        echo "    ✗ Failed to list ${dir_path}"
        return 1
    fi
    
    for file in $files; do
        download_file "${dir_path}/${file}" || return 1
    done
}

echo "Installing glab-cli skill to ${TARGET_DIR}..."
echo ""

mkdir -p "${TARGET_DIR}/references"

# Download SKILL.md
download_file "SKILL.md" || exit 1

# Download entire references directory dynamically
download_directory "references" || exit 1

# Create symlinks for common clients
CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
CURSOR_SKILLS_DIR="$HOME/.cursor/skills"

mkdir -p "${CLAUDE_SKILLS_DIR}" "${CURSOR_SKILLS_DIR}"
ln -sfn "${TARGET_DIR}" "${CLAUDE_SKILLS_DIR}/glab-cli"
ln -sfn "${TARGET_DIR}" "${CURSOR_SKILLS_DIR}/glab-cli"

echo ""
echo "✓ Installation complete!"
echo "  Location: ${TARGET_DIR}"
echo "  Symlinks:"
echo "    ${CLAUDE_SKILLS_DIR}/glab-cli -> ${TARGET_DIR}"
echo "    ${CURSOR_SKILLS_DIR}/glab-cli -> ${TARGET_DIR}"
