# GitLab CLI (`glab`) Skill

A client-neutral agent skill for working with GitLab from the terminal through `glab`.

The repo name stays `claude-glab-skill`, but the installed skill directory and `SKILL.md` name are `glab-cli`. That keeps the runtime skill name stable across clients without renaming this repository.

The skill is organized around a short `SKILL.md` hot path plus topic-specific references. Command examples were re-validated against `glab 1.90.0` and current GitLab CLI documentation.

Supported hot-path coverage is intentionally narrow: merge requests, issues, CI/CD, repo targeting and inspection, clone/fork flows, self-hosted host selection, and `glab api`.

## Highlights

- Lean `SKILL.md` with explicit preflight and mutation guardrails
- Topic-specific references for auth, merge requests, issues, CI/CD, repo targeting, and API usage
- Updated command examples that match current `glab` help output
- Local verification scripts to catch stale examples before release

## Install `glab`

On macOS:

```bash
brew install glab
glab --version
```

For Linux, Windows, and source builds, use the official installation instructions:
https://docs.gitlab.com/editor_extensions/gitlab_cli/

## Install the Skill

### One-Line Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/wufei-png/glab-cli/main/install.sh | bash
```

This will:
- Download all skill files to `~/.agents/skills/glab-cli/`
- Create symlinks at `~/.claude/skills/glab-cli` and `~/.cursor/skills/glab-cli`

### Manual Install

Recommended portable layout:

```bash
mkdir -p ~/.agents/skills
cp -R /path/to/claude-glab-skill ~/.agents/skills/glab-cli
```

This layout is the primary install target for `Codex` and other clients that scan `~/.agents/skills/`.

For clients with their own user skill directories, point them at the same files with symlinks:

```bash
mkdir -p ~/.claude/skills ~/.cursor/skills
ln -sfn ~/.agents/skills/glab-cli ~/.claude/skills/glab-cli
ln -sfn ~/.agents/skills/glab-cli ~/.cursor/skills/glab-cli
```

If you prefer project-local installs instead of user-level installs, keep the skill directory name as `glab-cli` in the client-specific project skill root.

## Client Notes

- `Codex`: place the skill under `.agents/skills/glab-cli/` or `~/.agents/skills/glab-cli/`
- `Claude Code`: place the skill under `.claude/skills/glab-cli/` or `~/.claude/skills/glab-cli/`
- `Cursor`: place the skill under `.cursor/skills/glab-cli/` or `~/.cursor/skills/glab-cli/`
- `OpenCode`: use the skill root that your OpenCode setup scans; a shared `~/.agents/skills/glab-cli/` source plus symlinks keeps one copy of the files

## Repository Layout

```text
glab-cli/
├── .github/
│   └── workflows/
│       └── verify.yml
├── .glab-version
├── SKILL.md
├── references/
│   ├── api.md
│   ├── auth.md
│   ├── ci.md
│   ├── issues.md
│   ├── merge-requests.md
│   └── quick-reference.md
├── scripts/
│   ├── check-version-headers.sh
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

This repository is validated against `glab 1.90.0`. The pinned CLI version lives in `.glab-version`.

Before publishing changes, run:

```bash
cat .glab-version
glab --version
bash scripts/check-version-headers.sh
bash scripts/verify-commands.sh
```

The installed `glab` version should match `.glab-version` before you treat the verification results as authoritative.

`check-version-headers.sh` makes sure every documented `glab x.y.z` marker matches `.glab-version`.

`verify-commands.sh` checks the main command anchors against local `glab --help` output and fails if known stale examples reappear in the docs.

`.github/workflows/verify.yml` runs the pinned checks on pull requests and pushes to `main` when relevant files change, and also runs a weekly drift check against the latest `glab` release.

## Resources

- GitLab CLI docs: https://docs.gitlab.com/editor_extensions/gitlab_cli/
- GitLab CLI command reference: https://docs.gitlab.com/cli/
- GitLab CLI repository: https://gitlab.com/gitlab-org/cli
