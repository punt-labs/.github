# Contributing to Punt Labs

Thank you for your interest in contributing. This guide covers the essentials.

## Getting Started

Each repository has its own `CLAUDE.md` with project-specific setup instructions, quality gates, and architecture notes. Read that file first.

### General Prerequisites

- [uv](https://docs.astral.sh/uv/) for Python projects
- Xcode for Swift projects
- [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) for all repos (markdown CI)

## Development Workflow

### Branch Discipline

All changes go on feature branches. Never commit directly to `main`.

```bash
git checkout -b feat/short-description main
```

| Prefix | Use |
|--------|-----|
| `feat/` | New features |
| `fix/` | Bug fixes |
| `refactor/` | Code improvements |
| `docs/` | Documentation only |

### Commit Messages

Format: `type(scope): description`

```text
feat(search): add fuzzy matching
fix(relay): handle disconnection during fetch
refactor(tools): extract shared formatting
test(integration): add multi-user messaging tests
docs: update command reference
chore: bump dependency
```

One logical change per commit. Small commits are preferred over large ones.

### Quality Gates

Every commit must pass the project's quality gates before merge. These typically include linting, type checking, and tests. Check the project's `CLAUDE.md` for the exact commands.

## Submitting Changes

1. Push your branch and open a pull request.
2. Ensure CI passes on all commits.
3. Respond to review feedback.
4. Once approved and green, the PR will be merged.

### What Makes a Good PR

- Clear title and description explaining *why*, not just *what*.
- Small, focused scope. One concern per PR.
- Tests included for new behavior.
- README updated if user-facing behavior changed.
- CHANGELOG entry for notable changes.

## Reporting Bugs

Open an issue in the relevant repository with:

- What you expected to happen
- What actually happened
- Steps to reproduce
- Your environment (OS, language version, project version)

## Suggesting Features

Open an issue describing the problem you want to solve, not just the solution you have in mind. Context about your use case helps us evaluate the right approach.

## Standards

All projects follow [Punt Labs standards](https://github.com/punt-labs/punt-kit/tree/main/standards). When a project's `CLAUDE.md` conflicts with org standards, the project-specific instructions take precedence.

## License

By contributing, you agree that your contributions will be licensed under the same license as the project you are contributing to.
