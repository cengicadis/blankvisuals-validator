# PR checklist — v1.0.2

Use this before merging any branch into `main`.

## Pre-merge checks

```bash
bash scripts/verify.sh    # must exit 0
git ls-files              # must include .vscode/settings.json, must NOT include .DS_Store
```

## Files that must be present

| File | Purpose |
|------|---------|
| `SKILL.md` | Agent orchestration |
| `reference.md` | Rule catalog |
| `README.md` | Repo overview |
| `VALIDATION.md` | Repo verify spec |
| `docs/USAGE.md` | Human usage guide |
| `scripts/verify.sh` | RUN-01 verify command |
| `.gitignore` | Git exclusions |
| `.vscode/settings.json` | Project-only editor defaults |
| `LICENSE` | MIT licence |
| `CHANGELOG.md` | Version history |

## `.vscode/settings.json`

Committed file must contain **project-only** keys (e.g. `files.exclude`).
Must **not** contain `editor.cursorSmoothCaretAnimation` or `editor.cursorStyle` — use **User** settings for those.

## Not part of releases (never commit)

| File | Reason |
|------|--------|
| `.DS_Store` | macOS metadata — ignored via `.gitignore` |
| `.vscode/launch.json` | Local dev only — ignored via `.gitignore` |
| `.vscode/*.code-workspace` | Local only — ignored via `.gitignore` |

## After merge

Confirm on GitHub: **Code** → branch **main** → latest commit contains version tag `v1.0.2`.
