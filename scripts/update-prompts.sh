#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LIB_DIR="$SKILL_DIR/data/awesome-gpt-image-2-prompts"
CONFIG_FILE="$SKILL_DIR/config.json"

if [ ! -d "$LIB_DIR/.git" ]; then
  echo "Error: prompt library not found at $LIB_DIR"
  exit 1
fi

OLD_VERSION=$(jq -r '.prompt_library_version' "$CONFIG_FILE")

cd "$LIB_DIR"
git pull --ff-only 2>&1 || { echo "Error: git pull failed. Check your network connection."; exit 1; }

NEW_VERSION=$(git rev-parse --short HEAD)
CHANGES=$(git log --oneline "${OLD_VERSION}..${NEW_VERSION}" 2>/dev/null || echo "")

if [ "$OLD_VERSION" = "$NEW_VERSION" ]; then
  echo "Prompt library already up to date ($NEW_VERSION)."
  exit 0
fi

# Update config.json
UPDATED_AT=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
jq --arg ver "$NEW_VERSION" --arg ts "$UPDATED_AT" \
  '.prompt_library_version = $ver | .prompt_library_updated = $ts' \
  "$CONFIG_FILE" > "${CONFIG_FILE}.tmp" && mv "${CONFIG_FILE}.tmp" "$CONFIG_FILE"

# Report
echo "Updated: ${OLD_VERSION} → ${NEW_VERSION}"
echo ""
if [ -n "$CHANGES" ]; then
  echo "Changelog:"
  echo "$CHANGES" | while read -r line; do
    echo "  • $line"
  done
fi

# Count cases
CASE_COUNT=$(find "$LIB_DIR/cases" -name "*.md" | wc -l | tr -d ' ')
echo ""
echo "Now at ${CASE_COUNT} case files across 7 categories."
