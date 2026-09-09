<img width="1280" height="640" alt="Image" src="https://github.com/user-attachments/assets/c4c5bf70-d349-4288-9598-741c236623de" />

# BlankVisuals© Validator
#### Evidence-backed validation framework for AI agents, Cursor skills, MCP orchestrations, subagent graphs, hooks, and agentic repos — before deployment, not after.

| Field | Value |
|-------|-------|
| **Framework ID** | `FW-001` |
| **Full name** | `BlankVisuals© Validator` |
| **Version** | `v1.0.3` |
| **Date registered** | `2026-05-20` |
| **Domain package** | `cursor-skills` |
| **Method** | `precise & verify` — every rule needs verified evidence or `INCONCLUSIVE` |
| **License** | MIT |

## What it does

**BlankVisuals© Validator** is an open-source AI agent validation framework built as a **Cursor** Agent Skill.

When invoked, the agent:

1. Discovers your target (repo or agent built on FW-001)
2. Applies built‑in validation rules (no external overrides)
3. Runs checks in parallel where safe, then dependent checks (topology, E2E)
4. Records **verified evidence** per rule (file citations, tool results)
5. Delivers a **validation summary** as a Markdown table directly in the chat

It does **not** guess pass/fail. Unverified items are marked `INCONCLUSIVE`, not `PASS`.

------

## Installation

### Option A — Personal skill (recommended)

Clone or copy this folder into your Cursor skills directory:

```bash
git clone https://github.com/cengicadis/blankvisuals-validator ~/.cursor/skills/blankvisuals-validator
```
Cursor loads skills from `~/.cursor/skills/` automatically when the skill description matches your request.

------

### Option B — Project skill

**Copy into a project:**

```
your-project/.cursor/skills/blankvisuals-validator/
```

Commit `SKILL.md`, `reference.md`, and `.gitignore` with your project if the team should share the same validation workflow.

### Do not commit

- `.vscode/launch.json` and `.vscode/*.code-workspace` — local only (ignored via `.gitignore`)
- `.DS_Store` — macOS metadata (ignored)

### Committed with project defaults

- `.vscode/settings.json` — project-only keys; no personal editor prefs (v1.0.2+)

------

## Quick start

1. Open the repo or agent you want to validate in Cursor.
2. In chat, ask for validation, for example:
   - *"Run BlankVisuals validator on this repo"*
   - *"Validate this agent against FW-001"*
   - *"Validate this MCP orchestration against FW-001"*
   - *`/validate` this orchestration workflow*
3. Review the **Markdown validation summary** delivered in the chat.

The agent stamps **framework meta** (FW-001) at the start and sets **validation confirmation** only after evidence is complete.

------

## Documentation

| Document                               | Purpose                                             |
| :------------------------------------- | :-------------------------------------------------- |
| [docs/USAGE.md](docs/USAGE.md) | Step-by-step usage, prompts, and examples           |
| [SKILL.md](SKILL.md)          | Agent orchestration workflow (for the skill itself) |
| [reference.md](reference.md)  | Full rule catalog (STR, TOP, CON, SEC, RUN, …)      |

## Wiki

Full documentation available on the [GitHub Wiki](https://github.com/cengicadis/blankvisuals-validator/wiki):

| Page                                                         | What you'll find                                 |
| :----------------------------------------------------------- | :----------------------------------------------- |
| [Getting Started](https://github.com/cengicadis/blankvisuals-validator/wiki/Getting-Started) | Install, first run, example prompts              |
| [How It Works](https://github.com/cengicadis/blankvisuals-validator/wiki/How-It-Works) | Architecture, six domains, evidence standard     |
| [Rule Catalog](https://github.com/cengicadis/blankvisuals-validator/wiki/Rule-Catalog) | Every rule with check, pass, and fail conditions |
| [Framework Types](https://github.com/cengicadis/blankvisuals-validator/wiki/Framework-Types) | How to classify your target                      |
| [Custom Rules](https://github.com/cengicadis/blankvisuals-validator/wiki/Custom-Rules) | VALIDATION.md format and examples                |
| [Troubleshooting](https://github.com/cengicadis/blankvisuals-validator/wiki/Troubleshooting) | Common issues and fixes                          |

## Repository layout

```
blankvisuals-validator/
├── SKILL.md          # Cursor skill — orchestration & evidence standards
├── reference.md      # FW-001 rule catalog & taxonomy (canonical)
├── VALIDATION.md     # Informational – not loaded by validator
├── scripts/
│   └── verify.sh     # Developer structure check (not used by agent)
├── docs/
│   └── USAGE.md      # Human‑facing usage guide
├── .gitignore
├── LICENSE
└── README.md         # This file
```

**Canonical rules:** [reference.md](reference.md). The `scripts/verify.sh` script is a **developer tool** – the agent never executes it.

------

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

------

## Custom rules for your repo

The validator uses **built‑in rules** only. For documentation purposes, you can refer to [reference.md](reference.md). The `VALIDATION.md` file in the repo is **not loaded** to prevent injection.

## Outputs

| Deliverable        | Format                                                       |
| :----------------- | :----------------------------------------------------------- |
| Validation summary | Markdown table in the chat (FW-001 meta, pass/fail counts, critical IDs, evidence citations) |

**No files are written to disk.** All results are delivered only in the chat.

------

## Anti-patterns (avoid)

- Claiming `PASS` without command output or file citations
- Setting `validation_confirmation` before checks finish
- Vague findings ("looks fine", "probably safe")
- Reading sensitive files (`.env`, credentials, `AGENTS.md`, `CLAUDE.md`)
- Executing shell commands (all checks are read‑only)

------

## Versioning

Bump the patch version on each release (`1.0.0` → `1.0.1` → `1.0.2` → `1.0.3` …) in `SKILL.md`, `reference.md`, `README.md`, `docs/USAGE.md`, and `VALIDATION.md`.

------

## License

MIT — see [LICENSE](license/). Free to use, modify, and distribute with attribution.

------

## Attribution

BlankVisuals© Validator · Framework `FW-001` · registered `2026-05-20`.

