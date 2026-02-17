# Punt Labs Design Guidance

Standards and best practices for Claude-related projects. Use this document to audit existing projects and guide new ones.

---

## 1. Distribution

Every project must have a frictionless install path appropriate to its type.

### Plugin projects (Claude Code)

Must have a `curl | bash` installer (`install.sh`) that:
- Clones the repo to `~/.claude/plugins/local-plugins/plugins/<name>`
- Checks out the latest semver tag
- Registers the plugin in `marketplace.json`
- Checks for runtime dependencies (or prompts to install them)
- Clears the plugin cache
- Prints a success message with the entry-point command

Pattern: `prfaq/install.sh`, `claude-dungeon/install.sh`.

### MCP server projects (Claude Code + Claude Desktop)

Must be published to **PyPI** and installable via `pip install <name>` or `uv tool install <name>`.

Must have an `install` subcommand that configures the MCP server for Claude Code (`claude mcp add ...`).

Should have a **`.mcpb` bundle** for one-click Claude Desktop installation. Build with `@anthropic-ai/mcpb` via a `scripts/build-mcpb.sh` script. The `.mcpb` must be attached to GitHub releases.

Should have a `curl | bash` installer for the CLI path.

Pattern: `quarry-mcp`, `langlearn-tts`.

### Native apps

Distributed through platform-appropriate channels (App Store, TestFlight, Homebrew, or source build). Document build steps in the README.

---

## 2. CLI + Plugin Duality

Most tools should work two ways: as a standalone CLI and as a plugin or MCP server inside Claude. The CLI is for scripted and non-AI workflows. The plugin/MCP layer is for AI-assisted workflows. Users should not need Claude to perform deterministic operations.

**Deterministic operations belong in the CLI:**
- Compilation, formatting, linting
- Health checks and diagnostics
- Scaffolding and initialization
- Dependency verification

**AI-driven operations belong in the plugin:**
- Generation, analysis, review
- Natural language interaction
- Multi-step orchestration
- Agentic workflows

Projects that are inherently AI-driven (e.g., Dungeon, where Claude *is* the game engine) are exempt from CLI duality.

---

## 3. Doctor Commands

Every project with external dependencies must have a `doctor` command that reports pass/fail per dependency.

**CLI projects:** `<tool> doctor` (e.g., `biff doctor`, `quarry doctor`)

**Plugin-only projects:** `/<tool> doctor` slash command or equivalent (e.g., `/z doctor`)

The doctor command must check:
- Required binaries found and executable
- Required libraries/packages installed
- Correct versions where applicable
- Plugin registration (for Claude Code plugins)
- MCP server configuration (for MCP projects)
- Network connectivity (for projects with relay/API dependencies)

The installer should run `doctor` as its final step.

Pattern: `biff doctor`, `quarry doctor`, `langlearn-tts doctor`.

---

## 4. Plugin Structure

### plugin.json

Every Claude Code plugin must have a `plugin.json` with at minimum:

```json
{
  "name": "<project-name>",
  "description": "<one-line description>",
  "version": "<semver>",
  "author": {
    "name": "<author>",
    "email": "<email>",
    "organization": "Punt Labs"
  }
}
```

The `version` field is required. Omitting it is a defect.

### Extension point selection

Choose the right extension point for each capability:

| Extension Point | When to Use |
|----------------|-------------|
| **Skill** | Complex multi-phase workflows with branching logic. The skill defines *how Claude should behave* for the duration of a task. Use sparingly — most projects need zero or one. |
| **Command** | A discrete, user-invocable operation mapped to a slash command. One command per slash command. Self-contained. |
| **Agent** | A specialized sub-task that a skill or command delegates to. Has a distinct role, model preference, and tool restrictions. Use when the sub-task benefits from isolation or a different model. |
| **Hook** | Event-driven automation triggered by tool calls or lifecycle events. Use for output suppression, validation, or side effects. |
| **MCP Server** | Exposes tools that Claude (or any MCP client) can call. Use when the project has deterministic operations (I/O, computation, state management) that should not be prompt-driven. |

### Output suppression

Any project that uses MCP tools inside Claude Code must have a **PostToolUse hook** that suppresses raw MCP tool output. Without this, JSON payloads from tool calls pollute the conversation.

Pattern: `biff/hooks/suppress-output.sh`, `claude-dungeon/hooks/hooks.json`.

The hook should match the project's MCP tool name pattern (e.g., `mcp__biff__*`, `mcp__plugin_dungeon_game__*`).

### Command tool restrictions

Commands that invoke external tools (compilers, linters, test runners) should declare `allowed-tools` in their frontmatter to restrict what Claude can execute. This prevents unintended side effects.

Pattern: Z Spec commands restrict Bash to `fuzz:*` and `probcli:*` calls only.

---

## 5. Cross-Project Integration

Projects may optionally integrate with other Punt Labs tools. Integrations must be:

- **Optional** — the project works fully without the dependency
- **Graceful** — check for the dependency at runtime, fall back silently if absent
- **One-way** — project A may use project B, but B must not know about A

Current integrations:
- **PR/FAQ uses Quarry** — researcher agent searches indexed documents during `/prfaq:research` and Phase 0 discovery
- **Z Spec should use Quarry** — domain docs could inform spec generation (planned, `claude-z-spec-plugin-p81`)

When adding an integration, document it in the consuming project's README and PROJECTS.md. Do not add references in the upstream project.

---

## 6. Issue Tracking

All projects use **beads** (`bd`) for issue tracking.

### Setup

Every repo must have beads initialized (`bd init`). The `.beads/` directory is committed to git.

### Workflow

- `bd create "title"` to create issues with `--type` (task, bug, feature, spike) and `--priority` (1-5)
- `bd ready` to find available work
- `bd update <id> --status in_progress` before starting
- `bd close <id>` when complete
- Work is not complete until `git push` succeeds

### Issue quality

Issues must have:
- A clear title in imperative form
- A description with enough context for another engineer (or agent) to act on
- Correct type and priority
- Dependencies declared (`--blocks`, `--blocked-by`) when applicable

---

## 7. Code Standards

### Python projects (Biff, Quarry, LangLearn TTS)

- Package manager: **uv**
- Distribution: published to **PyPI** (`uv publish` or `uv tool publish`)
- Linting: **ruff** (`ruff check .`, `ruff format .`)
- Type checking: **mypy** (`mypy src/ tests/`)
- Testing: **pytest**
- Fully typed (`py.typed` marker)
- MCP server framework: **FastMCP**
- CLI framework: **typer** + **rich**

### Swift projects (Quarry Menu Bar, Koch Trainer)

- Formatting: **swiftformat**
- Linting: **swiftlint**
- Project generation: **XcodeGen** (from `project.yml`)
- UI framework: **SwiftUI** with `@Observable`
- Testing: **XCTest**

### JavaScript projects (Dungeon MCP server)

- MCP SDK: **@modelcontextprotocol/sdk**
- Schema validation: **zod**

### Markdown-only projects (PR/FAQ, Z Spec)

- No application code — all logic lives in prompts
- Skills, agents, commands, and reference guides are markdown files
- Shell scripts (`install.sh`, `compile_prfaq.sh`) handle deterministic operations

---

## 8. Versioning

Projects follow **semver** (`major.minor.patch`).

- Plugin projects: version in `plugin.json`
- PyPI projects: version in `pyproject.toml` (and `manifest.json` for `.mcpb` builds — must match)
- Swift projects: version in `project.yml`
- Installers: check out the latest semver git tag

---

## 9. Naming Conventions

| Component | Convention | Examples |
|-----------|-----------|---------|
| PyPI package | `<name>-mcp` when it's an MCP server | `biff-mcp`, `quarry-mcp`, `langlearn-tts` |
| CLI command | Short, lowercase, no prefix | `biff`, `quarry`, `langlearn-tts` |
| Slash command | `/<name>` or `/<name>:<subcommand>` | `/prfaq`, `/prfaq:review`, `/z check` |
| Plugin directory | Match the plugin name | `plugins/prfaq/`, `plugins/z-spec/` |
| Bead ID prefix | Auto-detected from directory name | `biff-*`, `prfaq-*`, `quarry-*` |

---

## 10. Audit Checklist

Use this checklist to audit a project for compliance:

- [ ] **Install path exists** — `curl | bash`, PyPI, `.mcpb`, or documented build steps
- [ ] **Doctor command exists** — if the project has external dependencies
- [ ] **CLI available** — for deterministic operations (exempt: purely AI-driven projects)
- [ ] **plugin.json has version** — if the project is a Claude Code plugin
- [ ] **PostToolUse hook exists** — if the project uses MCP tools in Claude Code
- [ ] **Beads initialized** — `.beads/` directory exists and is committed
- [ ] **README documents installation** — clear, copy-pasteable install instructions
- [ ] **Linting and type checking configured** — per language standards above
- [ ] **Tests exist and pass** — `pytest`, `XCTest`, or equivalent
- [ ] **Cross-project integrations are optional and one-way** — no circular dependencies
