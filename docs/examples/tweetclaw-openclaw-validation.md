# Custom validation example: OpenClaw social tool plugin

This example shows how to extend FW-001 with repo-specific checks for a real
OpenClaw tool plugin. It uses
[TweetClaw](https://github.com/Xquik-dev/tweetclaw) as the target because the
package exposes an OpenClaw plugin, packaged skill, runtime tools, config
schema, and approval-gated social actions.

Use this as a starting point for validating any OpenClaw plugin that exposes
agent-callable tools. Keep the target's own docs, manifest, and command output
as the source of truth for each run.

## Example VALIDATION.md

```markdown
# Validation spec: TweetClaw OpenClaw plugin

## Framework
id: FW-001
name: BlankVisuals© Validator
version: v1.0.3
type: mcp-orchestration
source: @xquik/tweetclaw
domain_package: openclaw-plugin

## Scope

Validate the public OpenClaw plugin package for search tweets, search tweet
replies, follower export, user lookup, media workflows, monitors, webhooks,
direct messages, giveaway draws, and approval-gated posting.

## Rules

- id: CUSTOM-OPENCLAW-01
  check: OpenClaw install docs use an explicit source selector for the npm package.
  pass: Docs show `openclaw plugins install npm:@xquik/tweetclaw`.
  fail: Docs rely only on an ambiguous bare package name.

- id: CUSTOM-OPENCLAW-02
  check: Runtime inspection proves tool and skill registration.
  pass: `openclaw plugins inspect tweetclaw --runtime --json` shows the plugin and the expected runtime surfaces.
  fail: Runtime inspection is skipped, fails, or does not show the declared surfaces.

- id: CUSTOM-OPENCLAW-03
  check: Live endpoint invocation stays optional.
  pass: The manifest marks the live `tweetclaw` tool optional and docs require explicit allowlisting before use.
  fail: The live endpoint invoker is available to the model by default.

- id: CUSTOM-OPENCLAW-04
  check: Risky social actions keep a human approval gate.
  pass: Write-like calls document one-time approval or denial before post, delete, follow, DM, monitor, webhook, media, draw, or profile-change actions.
  fail: Docs or runtime behavior let the agent perform risky actions without review.

- id: CUSTOM-OPENCLAW-05
  check: Config fields treat credentials and signing material as secrets.
  pass: Manifest UI hints mark credential fields sensitive and examples avoid literal secret values.
  fail: Examples include real tokens, API keys, signing keys, cookies, or session data.

## Commands

verify: npm run check-openclaw-platform-fitness
package: npm run check-package-artifact
inspect: openclaw plugins inspect tweetclaw --runtime --json
```

## Evidence to collect

- `package.json` with `openclaw.extensions`, runtime extension metadata, and
  install metadata for `@xquik/tweetclaw`.
- `openclaw.plugin.json` with tool contracts, optional tool metadata,
  `configSchema`, and sensitive UI hints.
- OpenClaw docs or local CLI output that confirms the explicit `npm:` install
  selector and runtime inspection command.
- Target docs that show user review before posting, replying, direct messages,
  monitor creation, webhook delivery, media actions, draws, profile changes, or
  other account-affecting calls.
- Command output for the target's validation gates. Mark unavailable local
  OpenClaw runtime checks as `INCONCLUSIVE`, not `PASS`.

## Expected classification

Classify the target as:

- `mcp-orchestration`, because the agent calls declared tools through the
  OpenClaw runtime.
- `plugin-marketplace`, because package metadata, install selectors, manifest
  fields, and listing surfaces affect discovery and installation.
- `skill-chain`, when validating the packaged `SKILL.md` alongside the plugin
  runtime.

The run should still apply the built-in FW-001 rules for structure, contracts,
security, runtime, and discovery after resolving this custom spec.
