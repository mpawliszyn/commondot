# commondot

Personal development environment -- dotfiles and AI agent config.

## What this is

This repo manages two domains that live together because they're parts
of one developer environment:

- **Machine/terminal config** -- shell, git, SSH, editor, prompt
- **AI agent config** -- behavioral guidance, personal profile, context management

## Repository structure

```
shell/              Zsh (zshrc, zshenv), Starship, Topgrade configs
git/                Git config and global gitignore (XDG)
ssh/                SSH config + 1Password setup docs
editor/             Neovim config (XDG)
terminal/           Ghostty config and custom theme (XDG)
agents/             Tool-agnostic AI agent profile
archive/            Old files kept for reference (temporary)
private/            Gitignored employer-specific overrides
docs/plans/         Design documents
docs/TODO.md        Future projects roadmap
bootstrap.sh        Phase 1 setup for new machines
AGENTS.md           Agent behavioral guidance
CLAUDE.md           Symlink -> AGENTS.md (Claude Code compatibility)
```

## Conventions

**XDG paths:** Configs use `~/.config/` where tools support it.
Symlinks to `$HOME` only for tools that don't (zsh, SSH).

**~/Development:** All git repos live under `~/Development/`.
Configs and scripts rely on this convention.

**Symlinks, not copies:** Config files are symlinked from their
standard locations to this repo. Edit in repo, changes tracked by git.

**Public/private boundary:** The `private/` directory is gitignored and
holds employer-specific config overrides. The shell sources
`~/Development/commondot/private/zshrc` if it exists -- its absence
is normal on a fresh machine. A pre-commit hook scans against
`.private-patterns` to prevent accidental leaks.

## Setup

### New machine

```bash
curl -fsSL https://raw.githubusercontent.com/mpawliszyn/commondot/main/bootstrap.sh | bash
cd ~/Development/commondot && claude
```

Phase 1 (bootstrap.sh) installs Homebrew, core tools, Oh My Zsh,
and clones this repo. Phase 2 (Claude Code) reads AGENTS.md, diffs
desired vs actual state, and applies changes with confirmation.

### Existing machine

```bash
git clone git@github.com:mpawliszyn/commondot.git ~/Development/commondot
cd ~/Development/commondot && claude
```

## Documentation philosophy

We use an audience test for information placement:

- **Would a human benefit?** -> README (or linked doc)
- **Only an agent needs it?** -> AGENTS.md
- **Neither?** -> Don't write it

Both files are navigational hubs that link to details rather than
containing everything. This is more opinionated than the
[agents.md standard](https://agents-md.org) but works better for us.

See [ssh/README.md](ssh/README.md) for 1Password SSH setup.
See [docs/TODO.md](docs/TODO.md) for the future projects roadmap.
