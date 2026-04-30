#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LIB_DIR="$SKILL_DIR/data/awesome-gpt-image-2-prompts"

echo "🧙 Prompt Wizard — Setup"

# Already initialized
if [ -f "$LIB_DIR/README.md" ]; then
  VERSION=$(cd "$LIB_DIR" && git rev-parse --short HEAD 2>/dev/null || echo "unknown")
  echo "Case library already present (version: $VERSION)"
  echo "Run /update to pull the latest prompts."
  exit 0
fi

# Try submodule
if [ -f "$SKILL_DIR/.gitmodules" ]; then
  echo "Initializing submodule..."
  cd "$SKILL_DIR"
  git submodule update --init --recursive 2>/dev/null && {
    VERSION=$(cd "$LIB_DIR" && git rev-parse --short HEAD)
    echo "Submodule initialized (version: $VERSION)"
    exit 0
  }
  echo "Submodule init failed, trying direct clone..."
fi

# Direct clone
echo "Cloning case library..."
git clone https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts.git "$LIB_DIR" 2>/dev/null || {
  echo ""
  echo "Setup failed. Please check your network connection and try again."
  echo "Manual setup:"
  echo "  git clone https://github.com/EvoLinkAI/awesome-gpt-image-2-prompts.git $LIB_DIR"
  exit 1
}

VERSION=$(cd "$LIB_DIR" && git rev-parse --short HEAD)
echo "Case library ready (version: $VERSION)"
echo "Run /update to pull the latest prompts."
