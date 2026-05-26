```markdown
# Contributing to BlankVisuals© Validator

Contributions that improve coverage, accuracy, and usability are welcome.

## What we need most

**New test cases for the rule catalog**
Real-world scenarios that expose gaps in existing rules. Submit with: rule ID, target type, test input, expected behavior, observed behavior in failing cases.

**New framework type support**
Coverage for agent types not yet in the taxonomy. Follow the pattern in `reference.md#framework-taxonomy`.

**Rule clarifications**
If a rule's pass/fail criteria is ambiguous in practice, open an issue with a concrete example.

**Custom VALIDATION.md examples**
Real-world repo specs (anonymized if needed) that show how teams extend FW-001 for their context.

## What we do not accept

- Rule changes without a concrete failing example that motivates the change
- Threshold changes without evidence from multiple real validations
- Content that duplicates existing rules without clear justification
- AI-generated contributions submitted without human review and validation

## How to contribute

1. Fork the repository
2. Create a branch: `type/brief-description`
   - `rule/sec-mcp-auth-check`
   - `docs/usage-mcp-example`
   - `fix/str-skl-threshold`
3. Make your changes following the formatting of existing files
4. Submit a pull request with:
   - What changed and why
   - A concrete example or evidence motivating the change

## Formatting

- Markdown only
- Rule tables follow the `ID | Check | Pass | Fail` pattern in `reference.md`
- Sentence case everywhere — no Title Case, no ALL CAPS
- Code blocks for commands, payloads, YAML examples

## Versioning

- **Patch** `1.0.x` — clarifications, formatting, examples
- **Minor** `1.x.0` — new rules, new framework types, new checklists
- **Major** `x.0.0` — changes to scoring methodology or layer structure

Major version changes require an open issue and discussion before implementation.

## Attribution

All contributors are credited in release notes.

---

BlankVisuals© Validator · Framework `FW-001` · MIT License
```
