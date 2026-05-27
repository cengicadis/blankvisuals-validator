<img width="1280" height="640" alt="Image" src="https://github.com/user-attachments/assets/c4c5bf70-d349-4288-9598-741c236623de" />

# BlankVisuals© Validator
#### Evidence-backed validation framework for AI agents, Cursor skills, MCP orchestrations, subagent graphs, hooks, and agentic repos — before deployment, not after.

| Field | Value |
|-------|-------|
| **Framework ID** | `FW-001` |
| **Full name** | `BlankVisuals© Validator` |
| **Version** | `v1.0.2` |
| **Date registered** | `2026-05-20` |
| **Domain package** | `cursor-skills` |
| **Method** | `precise & verify` — every rule needs verified evidence or `INCONCLUSIVE` |
| **License** | MIT |

## What it does

**BlankVisuals© Validator** is an open-source AI agent validation framework built as a **Cursor** Agent Skill.

When invoked, the agent:

1. Discovers your target (repo or agent built on FW-001)
2. Resolves validation rules (your spec → repo `VALIDATION.md` → built-in catalog)
3. Runs checks in parallel where safe, then dependent checks (topology, E2E)
4. Records **verified evidence** per rule (commands, file citations, tool results)
5. Delivers a **validation canvas** plus a short chat summary

It does **not** guess pass/fail. Unverified items are marked `INCONCLUSIVE`, not `PASS`.

## Installation

### Option A — Personal skill (recommended)

Clone or copy this folder into your Cursor skills directory:

```bash
git clone https://github.com/cengicadis/blankvisuals-validator ~/.cursor/skills/blankvisuals-validator
```

Cursor loads skills from `~/.cursor/skills/` automatically when the skill description matches your request.

### Option B — Project skill

Copy into a project:

```text
your-project/.cursor/skills/blankvisuals-validator/
```

Commit `SKILL.md`, `reference.md`, and `.gitignore` with your project if the team should share the same validation workflow.

### Do not commit

- `.vscode/launch.json` and `.vscode/*.code-workspace` — local only (ignored via `.gitignore`)
- `.DS_Store` — macOS metadata (ignored)

### Committed with project defaults

- `.vscode/settings.json` — project-only keys; no personal editor prefs (v1.0.2+)

## Quick start

1. Open the repo or agent you want to validate in Cursor.
2. In chat, ask for validation, for example:
   - *"Run BlankVisuals validator on this repo"*
   - *"Validate this agent against FW-001"*
   - *"Validate this MCP orchestration against FW-001"*
   - *`/validate` this orchestration workflow*
3. Review the **canvas** (`canvases/blankvisuals-validation-<target>.canvas.tsx`) and the chat summary.

The agent stamps **framework meta** (FW-001) at the start and sets **validation confirmation** only after evidence is complete.

## Documentation

| Document | Purpose |
|----------|---------|
| [docs/USAGE.md](docs/USAGE.md) | Step-by-step usage, prompts, deliverables, custom rules |
| [SKILL.md](SKILL.md) | Agent orchestration workflow (for the skill itself) |
| [reference.md](reference.md) | Full rule catalog (STR, TOP, CON, SEC, RUN, …) |

## Wiki

Full documentation available on the [GitHub Wiki](https://github.com/cengicadis/blankvisuals-validator/wiki):

| Page | What you'll find |
|------|-----------------|
| [Getting Started](https://github.com/cengicadis/blankvisuals-validator/wiki/Getting-Started) | Install, first run, example prompts |
| [How It Works](https://github.com/cengicadis/blankvisuals-validator/wiki/How-It-Works) | Architecture, six domains, evidence standard |
| [Rule Catalog](https://github.com/cengicadis/blankvisuals-validator/wiki/Rule-Catalog) | Every rule with check, pass, and fail conditions |
| [Framework Types](https://github.com/cengicadis/blankvisuals-validator/wiki/Framework-Types) | How to classify your target |
| [Custom Rules](https://github.com/cengicadis/blankvisuals-validator/wiki/Custom-Rules) | VALIDATION.md format and examples |
| [Troubleshooting](https://github.com/cengicadis/blankvisuals-validator/wiki/Troubleshooting) | Common issues and fixes |

## Repository layout

```text
blankvisuals-validator/
├── SKILL.md          # Cursor skill — orchestration & evidence standards
├── reference.md      # FW-001 rule catalog & taxonomy (canonical)
├── VALIDATION.md     # Repo verify spec (RUN-01)
├── scripts/
│   └── verify.sh     # Structure verify command
├── docs/
│   └── USAGE.md      # Human-facing usage guide
├── .gitignore
├── LICENSE
└── README.md         # This file
```

**Canonical rules:** [reference.md](reference.md). **Verify:** `bash scripts/verify.sh` (see [VALIDATION.md](VALIDATION.md)).

## Targets in scope

Validate any AI agent, prompt workflow, or agentic repo against a structured rule catalog with verified evidence per finding.

Supported targets:

- Skill chains (`SKILL.md`, skill frontmatter)
- Hook pipelines (`hooks.json`)
- Subagent graphs (Task tool, resume/interrupt)
- MCP orchestration
- `@cursor/sdk` automation
- Plugin marketplace layouts (`.cursor-plugin`, manifests)

See [Framework taxonomy](reference.md#framework-taxonomy) in `reference.md`.

## Custom rules for your repo

Add a repo-level spec so validation matches your project:

- `VALIDATION.md` (repo root), or
- `docs/validation.md`, or
- `.cursor/validation/`

Format and examples: [docs/USAGE.md#custom-validation-rules](docs/USAGE.md#custom-validation-rules).

## Outputs

| Deliverable | Location / format |
|-------------|-------------------|
| Validation canvas | `canvases/blankvisuals-validation-<slug>.canvas.tsx` |
| Chat summary | Markdown in chat (FW-001 meta, pass/fail counts, critical IDs) |
| Evidence | Per-rule YAML blocks (command / file / tool) |

## Anti-patterns (avoid)

- Claiming `PASS` without command output or file citations
- Setting `validation_confirmation` before checks finish
- Using markdown tables instead of a canvas for the main report
- Validating `~/.cursor/skills-cursor/` (reserved)

## Versioning

Bump the patch version on each release (`1.0.0` → `1.0.1` → `1.0.2` → …) in `SKILL.md`, `reference.md`, `README.md`, `docs/USAGE.md`, and `VALIDATION.md`. See [CHANGELOG.md](CHANGELOG.md).

## License

MIT — see [LICENSE](LICENSE). Free to use, modify, and distribute with attribution.

## Attribution

BlankVisuals© Validator · Framework `FW-001` · registered `2026-05-20`.
