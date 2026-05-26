# BlankVisuals© Validator — reference (FW-001)

## Framework meta

| Field | Value |
|-------|-------|
| **ID** | `FW-001` |
| **Full name** | BlankVisuals© Validator |
| **Version** | `v1.0.2` |
| **Source** | `blankvisuals-validator` |
| **Date registered** | `2026-05-20` |
| **Domain package** | `cursor-skills` |
| **Agent build** | Validate agents and repos built on FW-001 |

**Validation confirmation:** ISO-8601 UTC `confirmed_at` + method `precise & verify` + `framework_id: FW-001` — recorded only after all evidence is collected.

## Framework taxonomy

Classify the **target** (agent/repo) before applying rules. Multiple tags allowed.

| Type | Signals | Focus rules |
|------|---------|-------------|
| **skill-chain** | `SKILL.md`, skill frontmatter, `disable-model-invocation` | STR-SKL, DISC-SKL, TOP-01 |
| **hook-pipeline** | `hooks.json`, hook scripts on agent events | STR-HOOK, RUN-HOOK, SEC-02 |
| **subagent-graph** | Task tool, `subagent_type`, resume/interrupt | TOP-*, PAR-*, STATE-* |
| **mcp-orchestration** | MCP descriptors, `CallMcpTool`, server folders | CON-MCP, SEC-MCP, RUN-MCP |
| **sdk-automation** | `@cursor/sdk`, `Agent.create`, CI agents | CON-SDK, RUN-SDK, SEC-03 |
| **heuristic-workflow** | Prompt-only plans, checklists, no hard contracts | TOP-HEU, OBS-*, DISC-HEU |
| **plugin-marketplace** | `.cursor-plugin`, manifest, component metadata | STR-PLG, CON-PLG |

## Rule catalog

Each rule: **check**, **pass**, **fail**. All findings include `framework_id: FW-001`.

### Meta (META)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| META-01 | Framework meta present in report | FW-001 block complete | Missing ID, version, or registered date |
| META-02 | Validation confirmation | `confirmed_at` ISO-8601 UTC; method `precise & verify` | Confirmation missing or set before evidence |
| META-03 | Agent-on-framework | Target declares or demonstrates FW-001 build | Target unrelated with no `built_on_fw_001` note |

### Structure (STR)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| STR-01 | List declared entrypoints vs repo files | Every declared path exists | Missing or stale path |
| STR-02 | Skill/hook paths not under `skills-cursor/` | User/project paths only | Writes or docs point to reserved dir |
| STR-03 | One canonical orchestration doc | Single `AGENTS.md` or equivalent names primary flow | Conflicting primary docs with no precedence |
| STR-SKL | Each skill has `name` + `description` in frontmatter | Valid YAML, description has WHAT+WHEN | Missing, >1024 char desc, or vague description |
| STR-HOOK | hooks.json schema and script paths | Valid JSON; scripts exist and executable | Broken refs or invalid event keys |
| STR-PLG | Plugin manifest paths | Manifest validates; components discoverable | Broken discovery or invalid manifest |

### Topology (TOP)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| TOP-01 | Map start → steps → terminal states | Documented termination; no infinite loops without guard | No terminal condition or cyclic handoff without exit |
| TOP-02 | Role boundaries | Each agent/step has single responsibility | Duplicate conflicting instructions across layers |
| TOP-HEU | Heuristic steps labeled | Steps marked heuristic vs deterministic | Critical path relies on unlabeled guesswork |
| TOP-03 | Human gates | Destructive/irreversible ops require explicit user step | Auto-runs force push, delete, or credential change |

### Contracts (CON)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| CON-01 | Inter-step I/O documented | Inputs/outputs specified per handoff | Silent schema change between steps |
| CON-02 | Schema validation where claimed | Sample payload validates against schema | Schema file missing or rejects documented example |
| CON-MCP | MCP tool descriptors before call | Schema read; required args present in examples | Undocumented required params |
| CON-SDK | SDK types match usage | Imports match installed SDK surface | References removed/renamed APIs |
| CON-PLG | Component metadata matches files | metadata paths exist | Orphan or wrong component type |

### Parallelism (PAR)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| PAR-01 | Parallel tasks independent | No shared mutable file edits in parallel plan | Parallel subagents assigned conflicting writes |
| PAR-02 | Merge strategy | Coordinator dedupes and orders findings | Duplicate contradictory PASS/FAIL without resolution |

### State (STATE)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| STATE-01 | Resume/checkpoint documented | ID or artifact named; resume path tested or specified | Resume mentioned but no identifier |
| STATE-02 | Idempotency | Re-run safe steps marked; side effects guarded | Double-submit causes duplicate external effect |
| STATE-03 | Session boundaries | Clear what persists across turns vs per-run | Hidden global state with no reset |

### Security (SEC)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| SEC-01 | Secrets | No tokens/keys in repo; env documented | Credentials in tracked files |
| SEC-02 | Hook/script scope | Scripts avoid broad `rm`, curl to unknown hosts without opt-in | Over-privileged automation |
| SEC-03 | Tool allowlist | MCP/tools scoped to task | "Use any tool" on sensitive repos without guard |
| SEC-MCP | Auth flow | `mcp_auth` only when needed; no auth spam | Repeated failed auth loops |

### Observability (OBS)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| OBS-01 | Logging/tracing | Steps emit identifiable markers or artifacts | Silent failure with no artifact |
| OBS-02 | Output paths | Reports/logs written to documented dirs | Ad-hoc paths only in chat |
| OBS-03 | Error surfacing | Failures include context and next action | Swallowed errors or generic "failed" |

### Runtime (RUN)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| RUN-01 | Documented verify command | Command run; exit 0 | Missing script or non-zero exit |
| RUN-02 | Lint/typecheck if project has them | Same as RUN-01 for project's standard check | Skipped when `package.json`/Makefile defines check |
| RUN-HOOK | Hook dry-run or test | Hook fires on sample event without throw | Hook crashes or mutates prod unintentionally |
| RUN-MCP | Smoke MCP tool | One read-only tool succeeds | Server unreachable or schema mismatch |
| RUN-SDK | SDK example or test | Example compiles or test passes | Broken sample in docs |

### Discovery (DISC)

| ID | Check | Pass | Fail |
|----|-------|------|------|
| DISC-SKL | Skill descriptions third-person + triggers | Matches create-skill conventions | First-person or no WHEN clause |
| DISC-HEU | Ambiguity handling | Unknown type → ask or INCONCLUSIVE | Invented rules without user/repo source |

## Severity

| Level | When |
|-------|------|
| **critical** | Security, data loss, wrong production action, invalid auth |
| **major** | Broken topology, contract break, failed verify command, META-02 fail |
| **minor** | Docs drift, style, non-blocking observability gaps |

**Overall PASS:** zero critical and major FAIL. Minor FAILs → PASS with warnings in canvas.

## Repo spec override format

```markdown
## Framework
id: FW-001
name: BlankVisuals© Validator
version: v1.0.2
type: skill-chain | ...

## Rules
- id: CUSTOM-01
  check: ...
  pass: ...
  fail: ...

## Commands
verify: npm run validate
```

Repo `Source` / `Domain package` values override `cursor-skills` in framework meta when set.

## Subagent prompts (templates)

**Structure explorer**

> Target built on FW-001. Explore [repo_root] for entrypoints (skills, hooks, AGENTS.md, MCP, SDK). Return: framework_type, entrypoints[], gaps vs STR-01/STR-03. Evidence only.

**Security explorer**

> Scan SEC-01/SEC-02/SEC-03. Return paths + excerpts. No PASS without evidence.

**Runtime shell**

> Run documented verify commands (read-only). Exit codes + last 30 lines. Map to RUN-*.
