# Future Projects

Extracted from the [design doc](plans/private/2026-03-07-dev-environment-design.md).

## Near-term

- **Review and delete archive/** -- once settings migration is complete
  and all value has been extracted, remove archive/ from the repo
- **Profile interview agent** -- deep exploration of values, produce
  richer profile
- **Nvim config deep-dive** -- modernize, evaluate plugins (telescope,
  treesitter, LSP)

## Medium-term

- **Session retro skill** -- auto-trigger on session end
- **Dotfile audit skill** -- periodic scan for untracked configs and
  installed packages. Maintain inventory of what's installed and why.
- **Lab/archive repo** -- private, with librarian subagent
- **Dossier / rich context system** -- tagged biography, librarian
  serves relevant slices per task context. Solves multi-tool profile
  delivery. Potential open-source tool.

## Someday

- **Bootstrap phase 2 as a skill**
- **Employer overlay system template**
- **Test on WSL/Windows** -- validate bootstrap and configs cross-platform
- **Enhanced topgrade sync** -- check for uncommitted changes before
  pulling, push after, handle conflicts
- **Split machine vs agent config** -- evaluate whether terminal config
  and AI agent config should be separate repos
