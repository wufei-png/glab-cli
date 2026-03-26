# GitLab CLI (`glab`) Skill

A Claude Code skill for working with GitLab from the terminal through `glab`.

The skill is now organized around a short `SKILL.md` hot path plus topic-specific references. Command examples were re-validated against `glab 1.90.0` and current GitLab CLI documentation.

Supported hot-path coverage is intentionally narrow: merge requests, issues, CI/CD, repo targeting and inspection, clone/fork flows, self-hosted host selection, and `glab api`.

## Highlights

- Lean `SKILL.md` with explicit preflight and mutation guardrails
- Topic-specific references for auth, merge requests, issues, CI/CD, repo targeting, and API usage
- Updated command examples that match current `glab` help output
- A local verification script to catch stale examples before release

## Install the Skill

```bash
# Project-specific installation
mkdir -p .claude/skills
git clone https://github.com/henricook/claude-glab-skill .claude/skills/glab

# Personal installation
mkdir -p ~/.claude/skills
git clone https://github.com/henricook/claude-glab-skill ~/.claude/skills/glab
```

## Install `glab`

On macOS:

```bash
brew install glab
glab --version
```

For Linux, Windows, and source builds, use the official installation instructions:
https://docs.gitlab.com/editor_extensions/gitlab_cli/

## Repository Layout

```text
.claude/skills/glab/
├── SKILL.md
├── references/
│   ├── api.md
│   ├── auth.md
│   ├── ci.md
│   ├── issues.md
│   ├── merge-requests.md
│   └── quick-reference.md
├── scripts/
│   └── verify-commands.sh
├── README.md
├── CONTRIBUTING.md
├── CHANGELOG.md
└── LICENSE
```

## Reference Map

- `SKILL.md`: entry point, preflight, execution policy, and the smallest set of workflows
- `references/quick-reference.md`: short cheat sheet, including repo view/clone/fork commands
- `references/auth.md`: authentication, repo context, self-hosted hosts, and auth failures
- `references/merge-requests.md`: MR creation, review, merge, and MR-specific failures
- `references/issues.md`: issue listing, creation, editing, and issue-specific failures
- `references/ci.md`: pipeline and job inspection, reruns, cancellation, and variables
- `references/api.md`: `glab api`, pagination, GraphQL, and automation patterns

## Usage Examples

```text
List my open merge requests
Create an issue for the bug we just found
Watch the current pipeline and tell me whether it passes
Use glab api to list all jobs for this pipeline
```

## Maintenance

This repository is validated against `glab 1.90.0`.

Before publishing changes, run:

```bash
bash scripts/verify-commands.sh
```

That script checks the main command anchors against local `glab --help` output and fails if known stale examples reappear in the docs.

## Resources

- GitLab CLI docs: https://docs.gitlab.com/editor_extensions/gitlab_cli/
- GitLab CLI command reference: https://docs.gitlab.com/cli/
- GitLab CLI repository: https://gitlab.com/gitlab-org/cli
