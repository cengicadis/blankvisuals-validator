# Changelog

All notable changes to BlankVisuals© Validator (FW-001) use [semantic versioning](https://semver.org/): **patch** `1.0.x` for fixes and doc updates, **minor** `1.x.0` for additive rules, **major** `x.0.0` for breaking framework changes.

## Changelog – blankvisuals-validator (FW-001 v1.0.2)
- Fixed self-contradictory instruction: Removed all references to reading from ~/.cursor/skills-cursor/ (reserved directory). The skill now uses a built‑in canvas template instead. Tightened activation triggers: Removed the overly broad keyword orchestrator from the description. Added explicit instruction not to activate on general mentions of orchestration without validation context.

- Prevented exposure of co‑installed skill prompts: Eliminated the instruction to read external skill files, thus removing the skill‑chaining attack surface.
Added security constraints: Explicitly forbids executing shell scripts (like scripts/verify.sh). All checks must be read‑only file inspections.
Added self‑validation prohibition: The validator is now forbidden from running against itself (any target that declares FW-001 as its own ID). A clear abort message is provided.

- Added ephemeral canvas handling: Instructs the agent to delete the generated canvas file after the validation summary is delivered, preventing persistence of sensitive workspace data. Also recommends adding canvases/*.canvas.tsx to .gitignore. Expanded anti‑patterns: Included new anti‑patterns for self‑validation, shell script execution, and leaving canvas files behind.

---

### [1.0.2] — 2026-05-20

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
