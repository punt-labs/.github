# Agent Instructions

This repo contains the GitHub org profile for punt-labs.

## Quality Gates

```bash
npx markdownlint-cli2 "**/*.md" "#node_modules"
```

## Structure

- `profile/README.md` — org profile page displayed on github.com/punt-labs
- `.github/workflows/` — CI workflows

## Documentation Discipline

- **README**: Update `profile/README.md` when the org profile, project list, or public-facing information changes.

## Code Review Flow

PR review follows punt-kit/standards/pr-review.md: local review (qodo review + silent-failure-hunter + code-reviewer) before the PR, then Qodo and Bugbot once at open, at most two rounds, Copilot only on request.

1. **Run local review** — `qodo review` + silent-failure-hunter + code-reviewer on the diff; fix what they find before the PR opens.
2. **Create PR** — push branch, open PR via `mcp__github__create_pull_request`. Prefer MCP GitHub tools over `gh` CLI.
3. **Answer every finding.** Qodo findings through the qodo CLI (`mark-implemented` or `dismiss`, with the reason); every other finding by a commit or a reasoned reply. Do not dismiss feedback as "unrelated to the change" or "pre-existing."
4. **Merge** via `mcp__github__merge_pull_request` (not `gh pr merge`) when `merge_gate` in punt-kit/standards/pr-review.md holds.

## Standards References

- [GitHub](https://github.com/punt-labs/punt-kit/blob/main/standards/github.md)
