# GitLab CLI (glab) Skill for Claude Code

A comprehensive Claude Code skill that provides expert guidance for using the GitLab CLI (`glab`) to manage GitLab resources directly from the command line.

## Overview

This skill enables Claude Code to effectively assist with GitLab workflows using the official `glab` CLI tool. It provides detailed knowledge about GitLab operations including merge requests, issues, CI/CD pipelines, repository management, and more.

## What This Skill Provides

- **Authentication guidance**: Setting up and managing GitLab authentication
- **Merge request workflows**: Creating, reviewing, approving, and merging MRs
- **Issue management**: Creating, viewing, and managing GitLab issues
- **CI/CD operations**: Monitoring pipelines, viewing logs, triggering runs
- **Repository operations**: Cloning, forking, and managing GitLab repositories
- **API access**: Direct GitLab API interactions via glab
- **Best practices**: Common workflows and troubleshooting guidance

## Installation

### Installing the Skill

This skill should be placed in your Claude Code skills directory:

```bash
# For project-specific installation
mkdir -p .claude/skills
cd .claude/skills
git clone <this-repo> glab

# For personal/global installation
mkdir -p ~/.claude/skills
cd ~/.claude/skills
git clone <this-repo> glab
```

### Installing glab CLI

Before using this skill, ensure `glab` is installed on your system:

**macOS:**
```bash
brew install glab
```

**Linux:**
```bash
# Debian/Ubuntu
sudo apt install glab

# Fedora/RHEL
sudo dnf install glab

# Arch Linux
sudo pacman -S glab
```

**Windows:**
```powershell
# Using Chocolatey
choco install glab

# Using Scoop
scoop install glab
```

**From source:**
```bash
go install gitlab.com/gitlab-org/cli/cmd/glab@latest
```

For more installation options, visit: https://gitlab.com/gitlab-org/cli

## Usage

Once installed, Claude Code will automatically detect when you need GitLab CLI assistance and can invoke this skill. You can also explicitly invoke it:

```
@claude using the glab skill, help me create a merge request
```

Or simply ask Claude Code to perform GitLab operations:

```
Can you list my open merge requests?
Create an issue for the bug we just found
Show me the status of the CI pipeline
```

## What's Included

### SKILL.md
The main skill file containing:
- Comprehensive command reference for all major glab commands
- Authentication and setup instructions
- Common workflows (creating MRs, reviewing code, monitoring CI/CD)
- Best practices and troubleshooting guidance
- Real-world usage examples

### Restricted Tools
The skill is configured with `allowed-tools: Bash, Read, Grep, Glob` to ensure Claude Code can:
- Execute glab commands via Bash
- Read configuration files and scripts
- Search for relevant files and patterns
- Work within the repository context

## Skill Features

### Command Coverage

The skill provides guidance for:

- **Authentication**: `glab auth login`, token management
- **Merge Requests**: `glab mr create`, `glab mr list`, `glab mr approve`, `glab mr merge`
- **Issues**: `glab issue create`, `glab issue list`, `glab issue view`
- **CI/CD**: `glab ci view`, `glab ci run`, `glab ci lint`
- **Repositories**: `glab repo clone`, `glab repo view`, `glab repo fork`
- **API**: `glab api` for custom API interactions
- **And many more**: labels, releases, snippets, users, variables, etc.

### Workflow Patterns

The skill includes complete workflow patterns for:
- Feature branch creation and merge request workflow
- Code review process
- CI/CD pipeline monitoring and troubleshooting
- Issue tracking and linking

### Self-Hosted GitLab Support

Full support for self-hosted GitLab instances with environment variable configuration and multi-instance authentication.

## Examples

After installation, Claude Code can help with tasks like:

**Creating a merge request:**
```
Create a merge request for my current branch with the title "Fix login bug" and assign it to reviewers alice and bob
```

**Reviewing merge requests:**
```
Show me all merge requests where I'm assigned as a reviewer
```

**Managing CI/CD:**
```
Watch the current pipeline and let me know if it passes
```

**Working with issues:**
```
Create a bug issue titled "API timeout" with high priority label
```

## Configuration

The skill automatically adapts to:
- Current repository context
- Authenticated GitLab instances
- Self-hosted GitLab via GITLAB_HOST environment variable
- Multiple authentication profiles

## Contributing

This skill is designed to be comprehensive and up-to-date. If you find commands or workflows that should be added, please contribute:

1. Test your additions with actual glab usage
2. Follow the imperative/infinitive writing style established in SKILL.md
3. Include practical examples
4. Update this README if adding major new sections

## Requirements

- Claude Code with Skills support
- glab CLI tool installed and in PATH
- Authenticated GitLab account (via `glab auth login`)
- Git repository context for repository-specific operations

## Troubleshooting

If Claude Code doesn't recognize the skill:
1. Verify the skill is in `.claude/skills/glab/` or `~/.claude/skills/glab/`
2. Ensure SKILL.md exists and has valid YAML frontmatter
3. Restart Claude Code if necessary

If glab commands fail:
1. Verify installation: `glab --version`
2. Check authentication: `glab auth status`
3. Ensure you're in a Git repository or use `-R owner/repo` flag

## Resources

- **glab Official Repository**: https://gitlab.com/gitlab-org/cli
- **GitLab CLI Documentation**: https://docs.gitlab.com/editor_extensions/gitlab_cli/
- **Claude Code Skills**: https://docs.claude.com/en/docs/claude-code/skills

## License

This skill is provided as a community resource for Claude Code users working with GitLab.

## Version

Version: 1.0.0
Last Updated: November 2025
Compatible with: glab v1.40.0+
