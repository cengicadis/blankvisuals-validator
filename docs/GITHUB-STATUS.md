# GitHub / PR status

## Check sync locally

```bash
git fetch origin
git rev-parse HEAD origin/main
# Same SHA = in sync — nothing left to push
```

## Cursor PR review vs GitHub

| Tool | What it shows |
|------|---------------|
| **GitHub** | Only **git-tracked** files |
| **Cursor PR review** | Sometimes **local workspace** files (false alarm) |

`.vscode/settings.json` is tracked with **project-only** settings. It must **not** contain `editor.cursorSmoothCaretAnimation` or `editor.cursorStyle`.

## Release checklist

1. `bash scripts/verify.sh` → exit 0
2. `git ls-files` → includes `.vscode/settings.json`, does **not** include `.DS_Store`
3. Bump version patch in all meta files + `CHANGELOG.md`
4. `git push origin main`

## `.vscode/settings.json` flagged in Cursor review

This is a Cursor false alarm — the file is intentionally committed with project defaults. Use **Dismiss** on that finding. It will not appear in GitHub's diff if already tracked.
