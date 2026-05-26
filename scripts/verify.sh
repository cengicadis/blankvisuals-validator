#!/usr/bin/env bash
# FW-001 RUN-01 verify — structure checks for blankvisuals-validator skill repo
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

required=(
  SKILL.md
  reference.md
  README.md
  docs/USAGE.md
  VALIDATION.md
  .gitignore
)

for f in "${required[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "FAIL: missing required file: $f" >&2
    exit 1
  fi
done

if ! head -1 SKILL.md | grep -q '^---$'; then
  echo "FAIL: SKILL.md missing YAML frontmatter" >&2
  exit 1
fi

if ! grep -q '^name: blankvisuals-validator' SKILL.md; then
  echo "FAIL: SKILL.md missing name: blankvisuals-validator" >&2
  exit 1
fi

if [[ ! -f .vscode/settings.json ]]; then
  echo "FAIL: missing .vscode/settings.json (project defaults)" >&2
  exit 1
fi

if grep -qE 'cursorSmoothCaretAnimation|cursorStyle' .vscode/settings.json 2>/dev/null; then
  echo "FAIL: personal editor prefs must not be in committed .vscode/settings.json" >&2
  exit 1
fi

echo "OK: blankvisuals-validator v1.0.2 structure verify passed"
exit 0
