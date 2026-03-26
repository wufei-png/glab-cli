# Changelog

All notable changes to this skill are documented here.

## [Unreleased]

### Changed

- Revalidated the skill against `glab 1.90.0`
- Replaced the monolithic reference layout with topic-specific files under `references/`
- Tightened `SKILL.md` so it focuses on preflight, guardrails, and high-value workflows
- Corrected outdated command examples for merge requests, issues, CI/CD, and `glab api`

### Added

- `references/auth.md`
- `references/merge-requests.md`
- `references/issues.md`
- `references/ci.md`
- `references/api.md`
- `scripts/verify-commands.sh` for local command-anchor validation

### Removed

- The old combined detailed-command reference
- The old combined troubleshooting reference

## [1.1.0] - 2025-11-06

### Changed

- Refactored the skill to use progressive disclosure with a smaller `SKILL.md`
- Added deeper reference material outside the main skill entry point

## [1.0.0] - 2025-11-05

### Added

- Initial release of the `glab` skill for Claude Code
