# Contributing

Use this repository like a maintained skill, not a generic command dump. The main job is to keep the examples aligned with real `glab` behavior while keeping `SKILL.md` small.

## Principles

- Keep `SKILL.md` focused on discovery, preflight, guardrails, and a few high-value workflows.
- Put detailed examples in the smallest relevant file under `references/`.
- Verify every new command against local `glab --help` output before documenting it.
- Prefer current flags over remembered aliases or guessed options.
- When a workflow is dangerous or state-changing, document the confirmation step before the command.

## Reference Layout

- `SKILL.md`: entry point and execution policy
- `references/auth.md`: auth, host selection, and repo context
- `references/merge-requests.md`: MR workflows
- `references/issues.md`: issue workflows
- `references/ci.md`: pipelines and jobs
- `references/api.md`: `glab api`
- `references/quick-reference.md`: compact cheat sheet

If a new topic does not fit one of those files cleanly, add a new reference file instead of bloating `SKILL.md`.

## Before You Commit

1. Confirm the local CLI version:

   ```bash
   glab --version
   ```

2. Check the commands you changed against help output:

   ```bash
   glab <command> --help
   ```

3. Run the verification script:

   ```bash
   bash scripts/verify-commands.sh
   ```

4. Review the changed markdown for stale file references and broken examples.

## Writing Guidance

- Use fenced `bash` blocks for commands.
- Keep examples short and task-oriented.
- Prefer examples that are safe to read before examples that mutate remote state.
- Avoid duplicating the same command block in multiple files.
- When a command changed between releases, document only the current supported form.

## Good Change Examples

- `Fix outdated ci cancel examples to use job/pipeline subcommands`
- `Move MR troubleshooting out of SKILL.md into references/merge-requests.md`
- `Add verified variables-from example for glab ci run`

## External Sources

When in doubt, validate against:

- `glab <command> --help`
- https://docs.gitlab.com/editor_extensions/gitlab_cli/
- https://docs.gitlab.com/cli/
