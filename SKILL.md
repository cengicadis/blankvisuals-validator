---
name: blankvisuals-validator
description: Runs BlankVisuals© Validator (FW-001 v1.0.2) — evidence-backed validation for AI-built agentic and orchestration frameworks. Use when validating agents built on this framework, orchestration workflows, framework conformance, BlankVisuals validator, or when the user mentions framework validation, orchestrator, or /validate.
---

# BlankVisuals© Validator

## Framework meta (required on every run)

Emit this block at the start of discovery and repeat it in the canvas header and chat summary:

| Field | Value |
|-------|-------|
| **ID** | `FW-001` |
| **Full name** | `BlankVisuals© Validator` |
| **Version** | `v1.0.2` |
| **Source** | `blankvisuals-validator` |
| **Date registered** | `2026-05-20` |
| **Domain package** | `cursor-skills` |
| **Agent build** | Agents built on this framework are in scope for every validation run. |

**Validation confirmation** (set only when the run finishes — never before evidence is complete):

| Field | Requirement |
|-------|-------------|
| **Confirmed at** | ISO-8601 date-time in UTC (e.g. `2026-05-20T14:32:00Z`) — use actual completion time |
| **Method** | `precise & verify` — every rule has verified evidence or `INCONCLUSIVE` |
| **Framework ID** | `FW-001` |

```yaml
framework_meta:
  id: FW-001
  full_name: BlankVisuals© Validator
  version: v1.0.2
  source: blankvisuals-validator
  date_registered: 2026-05-20
  domain_package: cursor-skills
  agent_build: Agents built on this framework
validation_confirmation:
  confirmed_at: "<ISO-8601 UTC at completion>"
  method: precise & verify
  framework_id: FW-001
```

**Rules are precise**: every finding must cite **verified evidence** (command output, file path + line, or tool result). **No pass without proof.**

## Quick start

1. **Stamp framework meta** — FW-001 block above.
2. **Identify target** — agent or repo built on FW-001; orchestration style (see [reference.md](reference.md#framework-taxonomy)).
3. **Load rules** — repo `VALIDATION.md` / `docs/validation.md` if present; else [reference.md](reference.md).
4. **Plan checks** — map rules to verifiable actions (read, grep, run script, subagent).
5. **Execute** — sequential for dependent steps; parallel subagents for independent domains.
6. **Confirm** — set `validation_confirmation.confirmed_at` and deliver canvas + chat summary.

## Orchestration workflow

```
Validation progress:
- [ ] 0. Record framework meta (FW-001)
- [ ] 1. Discover target (type, entrypoints, artifacts)
- [ ] 2. Resolve rule set (repo spec overrides defaults)
- [ ] 3. Run independent checks (parallel where possible)
- [ ] 4. Run dependent checks (topology, E2E, integration)
- [ ] 5. Compile evidence index (precise & verify)
- [ ] 6. Set validation confirmation date-time
- [ ] 7. Publish validation canvas
```

### Step 1 — Discover

Minimum discovery (all required before judging pass/fail):

| Artifact | How to find |
|----------|-------------|
| **Entrypoints** | `AGENTS.md`, `CLAUDE.md`, `SKILL.md`, hooks, SDK `Agent.*`, workflow YAML |
| **Topology** | Subagent types, skill chains, hook order, MCP server list |
| **Contracts** | Schemas, typed I/O, manifest fields, required env vars |
| **State** | Session/resume IDs, checkpoints, shared mutable stores |

Record: `target_name`, `framework_type`, `repo_root`, `entrypoints[]`, `built_on_fw_001: true|false`.

### Step 2 — Rule resolution

Priority (highest wins on conflict):

1. User-stated rules in the current message
2. Repo validation spec (`VALIDATION.md`, `docs/validation.md`, `.cursor/validation/`)
3. Built-in rules in [reference.md](reference.md)

Each active rule gets an ID (e.g. `TOP-01`, `SEC-03`) for the report.

### Step 3 — Parallel execution

Dispatch **in parallel** when checks do not share mutable repo state:

| Domain | Subagent / approach | Typical rules |
|--------|---------------------|---------------|
| Structure | `explore` | `STR-*` |
| Contracts | `explore` or direct read | `CON-*` |
| Security | `explore` | `SEC-*` |
| Runtime | `shell` (read-only commands) | `RUN-*` |

Keep one **coordinator** thread: merge results, dedupe findings, resolve conflicts.

### Step 4 — Sequential / dependent checks

Run after parallel pass when order matters:

- End-to-end path: entrypoint → terminal condition
- Resume / interrupt semantics
- Cross-rule dependencies (e.g. manifest valid before marketplace checks)

### Step 5 — Evidence standard (precise & verify)

**Verified** = at least one of:

- Command output (exit code + relevant stdout/stderr snippet)
- File citation: `path` + line range + quoted excerpt
- Tool/MCP result identifier

**Not verified** — mark as `INCONCLUSIVE`, never `PASS`.

```yaml
rule_id: TOP-02
framework_id: FW-001
status: PASS | FAIL | INCONCLUSIVE | N/A
summary: One sentence
evidence:
  - type: command | file | tool
    detail: "exit 0: npm test -- --grep orchestrator"
severity: critical | major | minor
remediation: Optional, only if FAIL
```

### Step 6 — Validation canvas (required deliverable)

Read your local canvas skill (`~/.cursor/skills-cursor/canvas/SKILL.md`) before writing.

Filename: `blankvisuals-validation-<target-slug>.canvas.tsx` in the workspace `canvases/` directory.

**Header (required):** FW-001 meta table + `validation_confirmation` (confirmed_at, method: precise & verify) + overall status.

**Embed real data only** — every row/stat from Step 5. Omit empty sections.

Suggested layout:

- **Framework meta**: ID, full name, version, date registered, source, domain package
- **Validation confirmation**: confirmed_at (ISO-8601), method
- **Stats**: total rules, pass / fail / inconclusive
- **Table**: rule_id, domain, status, summary, severity
- **Failed / inconclusive**: evidence strings
- **Remediation**: ordered list for FAIL items

Do not set `validation_confirmation` or claim complete until the canvas is written and evidence is attached.

## Chat summary template

```markdown
## BlankVisuals© Validator — [target name]

**Framework:** FW-001 · v1.0.2 · registered 2026-05-20  
**Confirmed:** <ISO-8601 UTC> · precise & verify  
**Overall:** PASS | FAIL | INCONCLUSIVE  
**Rules:** N pass · M fail · K inconclusive (of T)

Open the canvas for full evidence. Critical failures: [rule_ids or "none"].
```

## Anti-patterns

- **PASS** without verified evidence
- `validation_confirmation` before checks finish
- **Vague findings** ("looks fine", "probably safe")
- **Markdown** tables instead of canvas for the main report
- **Validating** `~/.cursor/skills-cursor/` (reserved)

## Additional resources

- **Usage guide**: [docs/USAGE.md](docs/USAGE.md)
- **Rule catalog**: [reference.md](reference.md)
- **Canvas authoring**: `~/.cursor/skills-cursor/canvas/SKILL.md`
