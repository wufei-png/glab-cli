# GitLab CLI (`glab`) Skill

## Current Recommendation

For most users, prefer the official bundled `glab` skill shipped by current GitLab CLI releases:

```bash
glab skills install --global
```

The official skill tracks new `glab` workflows more closely, including current merge request note commands such as `glab mr note create`, and is the better default for day-to-day GitLab agent work.

This repository remains useful when you want a smaller, conservative, client-neutral skill that:

- Keeps `SKILL.md` intentionally short and moves details into topic references
- Emphasizes safe agent behavior, including read-only preflight checks and mutation guardrails
- Supports shared installs across clients that scan `.agents/skills`
- Pins examples to a known `glab` version and provides local verification scripts for command drift

A client-neutral agent skill for working with GitLab from the terminal through `glab`.

This repository, the installed skill directory, and the `SKILL.md` name all use `glab-cli`. Keep that directory name when installing the skill so clients can discover the same runtime skill consistently.

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

### One-Line Install (Custom Skill)

```bash
curl -fsSL https://raw.githubusercontent.com/wufei-png/glab-cli/main/install.sh | bash
```

This will:
- Download all skill files to `~/.agents/skills/glab-cli/`

### Manual Install

Recommended portable layout:

```bash
mkdir -p ~/.agents/skills
cp -R /path/to/glab-cli ~/.agents/skills/glab-cli
```

This layout is the primary install target for clients that scan `~/.agents/skills/`.

For clients with their own user skill directories, point them at the same `glab-cli` directory with a copy or symlink.

If you prefer project-local installs instead of user-level installs, keep the skill directory name as `glab-cli` in the client-specific project skill root.

## Client Notes

- Standard user-level install: place the skill under `~/.agents/skills/glab-cli/`
- Standard project-local install: place the skill under `.agents/skills/glab-cli/`
- For clients with custom skill roots, keep the final directory name as `glab-cli`

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
