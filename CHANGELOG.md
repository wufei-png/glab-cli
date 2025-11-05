# Changelog

All notable changes to the glab skill for Claude Code will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-11-05

### Added
- Initial release of the glab skill for Claude Code
- Comprehensive SKILL.md with detailed command documentation
- Coverage of core glab commands:
  - Authentication (`glab auth`)
  - Merge Requests (`glab mr`)
  - Issues (`glab issue`)
  - CI/CD (`glab ci`, `glab pipeline`)
  - Repository operations (`glab repo`)
  - API access (`glab api`)
  - Labels, Releases, Snippets, Users
- Common workflow patterns:
  - Feature branch and MR workflow
  - Code review process
  - CI/CD pipeline monitoring
  - Issue tracking and linking
- Best practices and troubleshooting guidance
- Quick reference guide in `references/quick-reference.md`
- Comprehensive README.md with installation and usage instructions
- CONTRIBUTING.md with contribution guidelines
- MIT License
- .gitignore for common development artifacts

### Features
- Tool restrictions (`allowed-tools: Bash, Read, Grep, Glob`)
- Support for both GitLab.com and self-hosted instances
- Environment variable configuration (GITLAB_TOKEN, GITLAB_HOST)
- Multi-instance authentication support
- 30+ documented glab commands
- Real-world usage examples throughout

### Documentation
- Complete command reference with examples
- Common flags and options explained
- Project context detection guidance
- Configuration management instructions
- Error messages and solutions

## [Unreleased]

### Planned
- Additional examples for advanced workflows
- More coverage of `glab duo` AI features
- Enterprise GitLab feature documentation
- Integration patterns with CI/CD tools
- Scripts for common operations
- Video or animated examples
- Troubleshooting decision tree

## Notes

- This skill is based on glab v1.40.0+ command structure
- Tested with Claude Code Skills specification
- Designed following progressive disclosure principles
- Written in imperative/infinitive style as per Claude Code best practices

---

For the complete list of changes, see the [commit history](../../commits/main).
