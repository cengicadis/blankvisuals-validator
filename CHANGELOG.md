# Changelog

All notable changes to BlankVisuals© Validator (FW-001) use [semantic versioning](https://semver.org/): **patch** `1.0.x` for fixes and doc updates, **minor** `1.x.0` for additive rules, **major** `x.0.0` for breaking framework changes.

## [1.0.2] — 2026-05-20

### Added

- `LICENSE` — MIT licence.
- `VALIDATION.md` and `scripts/verify.sh` for RUN-01 structure verification.
- `domain_package: cursor-skills` set across all framework meta blocks.
- `.vscode/settings.json` committed with project-only defaults (no personal editor prefs).
- `.cursorignore` to exclude `.vscode/` and `.DS_Store` from Cursor agent indexing.

### Changed

- Canvas skill reference in `SKILL.md` updated to generic local path (`~/.cursor/skills-cursor/canvas/SKILL.md`) — removed hardcoded user path.
- README `.vscode/` install section clarified: `launch.json` untracked, `settings.json` committed.
- `docs/GITHUB-STATUS.md` and `docs/PR-CHECKLIST.md` moved into `docs/` for cleaner root.

### Fixed

- Version `v1.0.2` consistent across `SKILL.md`, `reference.md`, `README.md`, `docs/USAGE.md`, `VALIDATION.md`.

## [1.0.0] — 2026-05-20

### Added

- Initial FW-001 skill: `SKILL.md`, `reference.md`, `README.md`, `docs/USAGE.md`.
