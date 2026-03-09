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

Do **not** merge immediately after creating a PR. Expect **2–6 review cycles** before merging.

1. **Create PR** — push branch, open PR via `mcp__github__create_pull_request`. Prefer MCP GitHub tools over `gh` CLI.
2. **Request Copilot review** — use `mcp__github__request_copilot_review`.
3. **Watch for feedback in the background** — `gh pr checks <number> --watch` (run in background). Do not stop waiting. Copilot and Bugbot may take 1–3 minutes after CI completes.
4. **Read all feedback** via MCP: `mcp__github__pull_request_read` with `get_reviews` and `get_review_comments`.
5. **Take every comment seriously.** Do not dismiss feedback as "unrelated to the change" or "pre-existing." If you disagree, explain why in a reply.
6. **Fix and re-push** — commit fixes, push, re-run quality gates.
7. **Repeat steps 3–6** until the latest review is **uneventful** — zero new comments, all checks green.
8. **Merge only when the last review was clean** — use `mcp__github__merge_pull_request` (not `gh pr merge`).

## Standards References

- [GitHub](https://github.com/punt-labs/punt-kit/blob/main/standards/github.md)
