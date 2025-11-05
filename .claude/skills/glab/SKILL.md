---
name: glab
description: Expert guidance for using the GitLab CLI (glab) to manage GitLab issues, merge requests, CI/CD pipelines, repositories, and other GitLab operations from the command line. Use this skill when the user needs to interact with GitLab resources or perform GitLab workflows.
allowed-tools: Bash, Read, Grep, Glob
---

# GitLab CLI (glab) Skill

This skill provides comprehensive guidance for using `glab`, the official GitLab command-line interface tool, to perform GitLab operations efficiently from the terminal.

## When to Use This Skill

Invoke this skill when the user needs to:
- Create, view, or manage GitLab merge requests (MRs)
- Work with GitLab issues
- Monitor or trigger CI/CD pipelines
- Clone or manage GitLab repositories
- Interact with GitLab API
- Authenticate with GitLab instances
- Perform any GitLab-related operations from the command line

## Prerequisites

Before using glab commands, verify installation:
```bash
glab --version
```

If glab is not installed, inform the user and provide installation guidance based on their platform.

## Authentication

### Initial Setup
To authenticate with GitLab, use:
```bash
glab auth login
```

This interactive command prompts for:
- GitLab instance hostname (default: gitlab.com)
- Authentication method (token or web browser)
- API token (if token method chosen)

### Authentication via Token
For automated or scripted authentication:
```bash
# From stdin
echo "your-token" | glab auth login --stdin

# From file
glab auth login --stdin < myaccesstoken.txt

# With hostname and token
glab auth login --hostname gitlab.example.org --token xxxxx
```

### Environment Variables
Alternative authentication methods:
- `GITLAB_TOKEN` - GitLab API token
- `GITLAB_HOST` - GitLab instance hostname (for self-hosted)

Example:
```bash
GITLAB_HOST=gitlab.example.org glab repo clone mygroup/myproject
```

### Check Authentication Status
```bash
glab auth status
```

## Core Commands and Workflows

### Merge Requests (MR)

#### List Merge Requests
```bash
# List MRs assigned to you
glab mr list --assignee=@me

# List MRs where you're a reviewer
glab mr list --reviewer=@me

# List all open MRs
glab mr list

# Filter by state
glab mr list --state=merged
glab mr list --state=closed
```

#### Create Merge Request
```bash
# Create MR from current branch
glab mr create

# Create MR with title and description
glab mr create --title "Fix bug" --description "Fixes issue #123"

# Create MR for specific issue
glab mr create 123

# Create draft MR
glab mr create --draft

# Create MR and assign reviewers
glab mr create --reviewer=username1,username2

# Create MR with labels
glab mr create --label="bug,priority:high"
```

#### View and Interact with MR
```bash
# View MR details (opens in browser by default)
glab mr view 123

# View MR in terminal
glab mr view 123 --web=false

# Checkout MR branch locally
glab mr checkout 243

# Approve MR
glab mr approve 123

# Merge MR
glab mr merge 123

# Close MR
glab mr close 123

# Reopen MR
glab mr reopen 123

# Add note/comment to MR
glab mr note 123 -m "Looks good to me"
```

### Issues

#### List Issues
```bash
# List all issues
glab issue list

# List issues assigned to you
glab issue list --assignee=@me

# List issues with specific label
glab issue list --label=bug

# List closed issues
glab issue list --state=closed
```

#### Create and Manage Issues
```bash
# Create issue interactively
glab issue create

# Create issue with title and description
glab issue create --title "Bug in login" --description "Users cannot log in"

# Create issue with labels
glab issue create --title "Feature request" --label="enhancement,feature"

# View issue
glab issue view 456

# Close issue
glab issue close 456

# Reopen issue
glab issue reopen 456
```

### CI/CD Pipelines

#### View Pipelines
```bash
# Watch pipeline in progress
glab pipeline ci view

# List recent pipelines
glab ci list

# View specific pipeline status
glab ci status

# Get pipeline trace/logs
glab ci trace
```

#### Trigger Pipeline
```bash
# Run/trigger pipeline
glab ci run

# Run pipeline with variables
glab ci run --variables-file /tmp/variables.json

# Retry failed pipeline
glab ci retry

# Cancel running pipeline
glab ci cancel
```

#### CI Configuration
```bash
# Lint .gitlab-ci.yml file
glab ci lint

# View CI configuration
glab ci config
```

### Repository Operations

#### Clone Repository
```bash
# Clone repository
glab repo clone namespace/project

# Clone from self-hosted GitLab
GITLAB_HOST=gitlab.example.org glab repo clone groupname/project

# Clone repository by group
glab repo clone -g groupname
```

#### Repository Information
```bash
# View repository details
glab repo view

# Fork repository
glab repo fork

# Archive repository
glab repo archive namespace/project
```

### API Access

For direct API calls:
```bash
# Make API request
glab api projects/:id/merge_requests

# POST request with data
glab api --method POST projects/:id/issues --field title="Bug report"

# Paginated API request
glab api --paginate projects/:id/issues
```

### Other Useful Commands

#### Labels
```bash
# List labels
glab label list

# Create label
glab label create "bug" --color="#FF0000"
```

#### Releases
```bash
# List releases
glab release list

# Create release
glab release create v1.0.0

# View release
glab release view v1.0.0
```

#### Snippets
```bash
# List snippets
glab snippet list

# Create snippet
glab snippet create --title "Config" --filename config.yml
```

#### User Information
```bash
# View user information
glab user view username

# View current user
glab user view
```

## Common Flags and Options

Most glab commands support these common flags:
- `--help` - Show help for command
- `--repo` or `-R` - Specify repository (format: OWNER/REPO)
- `--web` or `-w` - Open in web browser
- `--output` or `-o` - Output format (e.g., json)
- `--verbose` - Enable verbose output

## Best Practices

### Command Execution
1. **Always verify authentication** before executing glab commands
2. **Use `--help` flag** to explore command options: `glab <command> --help`
3. **Specify repository context** with `-R` flag when working outside a Git repository
4. **Use environment variables** for automation and CI/CD contexts

### Error Handling
1. If authentication fails, check token validity and permissions
2. For self-hosted GitLab, ensure `GITLAB_HOST` is set correctly
3. If command is not found, verify glab installation with `which glab` or `glab --version`
4. Check repository context with `git remote -v` to ensure proper GitLab remote

### Workflow Integration
1. **Before creating MR**: Ensure current branch is pushed to remote
2. **CI/CD operations**: Run `glab ci lint` before pushing .gitlab-ci.yml changes
3. **Issue tracking**: Link MRs to issues using "Closes #123" in MR description
4. **Code review**: Use `glab mr list --reviewer=@me` to track review requests

## Common Workflows

### Creating and Merging a Feature Branch
```bash
# 1. Create feature branch
git checkout -b feature/new-feature

# 2. Make changes and commit
git add .
git commit -m "Implement new feature"

# 3. Push branch
git push -u origin feature/new-feature

# 4. Create merge request
glab mr create --title "Add new feature" --description "Implements feature X"

# 5. Wait for review and CI to pass

# 6. Merge when approved
glab mr merge <mr-number>
```

### Reviewing Merge Requests
```bash
# 1. List MRs awaiting review
glab mr list --reviewer=@me

# 2. Checkout MR to test locally
glab mr checkout <mr-number>

# 3. Test changes
# ... run tests ...

# 4. Approve if good
glab mr approve <mr-number>

# 5. Add comments if needed
glab mr note <mr-number> -m "Please update documentation"
```

### Monitoring CI/CD Pipeline
```bash
# 1. Trigger pipeline
glab ci run

# 2. Watch pipeline progress
glab pipeline ci view

# 3. If failed, view logs
glab ci trace

# 4. Retry if needed
glab ci retry
```

### Working with Issues
```bash
# 1. Create issue for bug
glab issue create --title "Login fails" --label=bug

# 2. Create branch for issue
git checkout -b fix/login-issue

# 3. Fix bug and create MR
glab mr create --title "Fix login issue" --description "Closes #<issue-number>"

# 4. After merge, verify issue closed
glab issue view <issue-number>
```

## Project Context Detection

glab automatically detects GitLab project context from:
1. Current Git repository's remote URL
2. Current working directory
3. `-R` or `--repo` flag for explicit specification

When working outside a repository, always specify the repository:
```bash
glab mr list -R owner/repo
```

## Configuration

glab configuration is stored in:
- Global: `~/.config/glab-cli/config.yml`
- Local (per-repo): `.git/glab-cli/config.yml`

View configuration:
```bash
glab config get
```

Set configuration:
```bash
glab config set key value
```

## Troubleshooting

### Common Issues and Solutions

**"command not found: glab"**
- Solution: Install glab or verify it's in PATH

**"failed to get current user: GET https://gitlab.com/api/v4/user: 401"**
- Solution: Authenticate with `glab auth login` or set GITLAB_TOKEN

**"fatal: not a git repository"**
- Solution: Navigate to a Git repository or use `-R owner/repo` flag

**"404 Project Not Found"**
- Solution: Verify repository name and ensure you have access permissions

**"failed to create merge request: source branch already has a merge request"**
- Solution: Check existing MRs with `glab mr list` for your branch

## Additional Resources

For command-specific help, always use:
```bash
glab <command> --help
glab <command> <subcommand> --help
```

To check for updates:
```bash
glab check-update
```

To enable shell completion:
```bash
glab completion --shell bash  # or zsh, fish, powershell
```

## Notes

- glab commands respect Git configuration and current repository context
- Most interactive commands can be automated with flags
- JSON output (`--output=json`) available for scripting and parsing
- glab works with both GitLab.com and self-hosted GitLab instances
- Multiple GitLab accounts can be authenticated simultaneously
