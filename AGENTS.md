# AGENTS.md -- commondot

> Read the [README](README.md) first. This file assumes you have.

## How to work here

- **Explain what you're doing and why.** Mike wants to understand every change.
- **Present options before acting.** Especially for config changes that
  affect the live environment.
- **Verify changes work.** Source the shell, check git identity, confirm
  symlinks point correctly.
- **Flag new dotfiles.** If you notice an untracked config file on the
  machine that should be in commondot, flag it.

## Guardrails

- **Pre-commit hook** scans staged content against `.private-patterns`.
  Never bypass with `--no-verify`. If it fires, review the match.
- **private/ is gitignored.** Employer-specific overrides go there.
  Its absence on a machine is normal, not an error.
- **No secrets in committed files.** Check your work.

## Commit conventions

- One logical change per commit
- Descriptive messages that explain *why*, not just *what*
- Never use `--no-verify`
- Never force-push to main

## Attribution

AI agents must have correct attribution configured before making commits.
Each tool manages its own attribution — there is no global hook.

**On first session:** Verify your tool's attribution settings are active.
For Claude Code, check that `attribution` is configured in settings
(`/config` or `~/.claude/settings.json`). The default includes
`Co-Authored-By` and is correct — just confirm it hasn't been disabled.

## Bootstrap phase 2 protocol

When setting up a new machine after bootstrap.sh:

1. Read this file and the README
2. Diff desired config vs actual machine state
3. If existing non-default config is detected, flag it and ask
   whether to migrate, skip, or back up
4. Present plan, get explicit confirmation
5. Apply changes
6. Verify: shell loads, git works, starship renders, profile loads
