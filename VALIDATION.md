# Validation spec — BlankVisuals© Validator (FW-001)

## Framework

```yaml
id: FW-001
name: BlankVisuals© Validator
version: v1.0.3
type: skill-chain
source: blankvisuals-validator
domain_package: cursor-skills
```

## Rules

Repo-specific checks beyond [reference.md](reference.md):

- **CUSTOM-01** — Core skill files exist (`SKILL.md`, `reference.md`, `README.md`, `docs/USAGE.md`, `VALIDATION.md`).

## Commands

```yaml
verify: bash scripts/verify.sh
```
