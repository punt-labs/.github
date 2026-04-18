# Punt Labs

Open source tools for software engineering teams using AI.

## About

Decades of computer science and software engineering research — structured product discovery, test-driven development, formal methods, and behavior-preserving transformations — have always worked. They were just challenging to apply consistently under pressure. We believe AI changes that equation. We build open source CLI tools, Claude Code plugins, and MCP servers to find out.

Our design standards and project guide live in [punt-kit](https://github.com/punt-labs/punt-kit). Our [tenets](https://www.punt-labs.com/about#tenets) document where we think agentic coding is heading.

## Projects

### Grounding

Structured discovery, formal specification, and enforcement — the stages most teams skip under pressure.

- [**PR/FAQ**](https://github.com/punt-labs/prfaq) `Claude Code` — Structured product discovery using Amazon's Working Backwards process. Specialized agents, simulated review meetings, compiled PDF output. Grounding for *what* to build.
- **Use Cases** — Guided use-case specification using Jacobson-Cockburn Use-Case Foundation v1.1. In development.
- [**Z Spec**](https://github.com/punt-labs/z-spec) `Claude Code` — Formal Z specifications for stateful systems. Extract specs from existing code (`code2model`) or generate code from specs (`model2code`). Type-check with fuzz, animate and model-check with ProB, derive test cases from specs. Grounding for *how* to build it.
- [**Ethos**](https://github.com/punt-labs/ethos) `CLI` `Claude Code` `Go` — The agent harness. Persistent identity (personality, writing style, expertise, roles, team structure) loads automatically every session. Typed mission contracts enforce write-set boundaries, bounded rounds, and frozen evaluators — with an append-only audit trail. Identity is the connection point; the harness is the whole system.
- **Refactory** — Deterministic, behavior-preserving refactoring. The AI decides what needs restructuring, Refactory executes on a parsed program model with formally defined preconditions. Built on Opdyke's original definition. In development.

### Building Blocks

Each capability ships as a library, CLI, MCP server, and REST API from a single codebase.

- [**Quarry**](https://github.com/punt-labs/quarry) `CLI` `Claude Code` `Claude Desktop` `macOS` — Local semantic search across your documents. 30+ formats, AST-level code parsing, offline. Works as a standalone CLI, an MCP server, or through the [menu bar app](https://github.com/punt-labs/quarry-menubar).
- [**Biff**](https://github.com/punt-labs/biff) `CLI` `Claude Code` — Team communication resurrecting BSD Unix vocabulary (`who`, `finger`, `write`, `plan`) over a NATS relay. Humans and agents show up side by side. Cross-repo messaging with org-scale peer discovery.
- [**Beadle**](https://github.com/punt-labs/beadle) `MCP` `Go` — Email for AI agents. PGP encryption and signing, four-level trust model (trusted, verified, untrusted, unverified). Supports Proton Bridge, external SMTP, and Resend API.
- [**MCP Proxy**](https://github.com/punt-labs/mcp-proxy) `CLI` `Go` — Process isolation for MCP servers. A ~6MB Go binary bridges MCP stdio to a shared daemon via WebSocket — one embedding model, one audio device, one connection pool across sessions.
- [**Vox**](https://github.com/punt-labs/vox) `CLI` `Claude Code` — Voice and music for AI agents. Multi-provider TTS (ElevenLabs, OpenAI, AWS Polly), spoken notifications, chimes, and background music generation. Opt-in only.
- [**Lux**](https://github.com/punt-labs/lux) `CLI` `Claude Code` — A visual output surface for AI agents. ImGui display server connected by Unix socket IPC — agents send JSON element trees, the display renders them at 60fps. 22 element kinds, interactive controls, incremental updates.
- **Tally** — Token consumption, model usage, and spend tracking across sessions and projects. In development.
- [**punt-kit**](https://github.com/punt-labs/punt-kit) `CLI` `Python` — Org standards, shared tooling, and project scaffolding. The `punt` CLI.

### Test Bed

Real projects where we discover what works and what doesn't.

- [**Koch Trainer**](https://github.com/punt-labs/koch-trainer-swift) `iOS` — Morse code trainer using the Koch method. Built from a formal [Z Spec](https://github.com/punt-labs/z-spec) specification — the design-to-code workflow in action. Publishing to the App Store.
- [**Cryptd**](https://github.com/punt-labs/cryptd) `CLI` `Claude Code` — Text adventure engine with an LLM narrator, rules engine, and graph-first scenario authoring. Three binaries: server, player CLI, and admin tool.

### Punts

Exploratory bets on where programming is going.

- [**Postern**](https://github.com/punt-labs/postern) `CLI` — Drive a live Pharo image from a coding agent or shell. HTTP server exposing a running Smalltalk image for agent-driven development — where there is no separation between the program and the machine running it.

## Install Everything

All CLIs and all Claude Code plugins in a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/punt-labs/.github/295fb95/install-all.sh | sh
```

## PyPI Packages

All Python packages are published under the `punt-` prefix on [PyPI](https://pypi.org):

| Package | CLI | Description |
|---------|-----|-------------|
| [`punt-kit`](https://pypi.org/project/punt-kit/) | `punt` | Project scaffolding and standards tooling |
| [`punt-biff`](https://pypi.org/project/punt-biff/) | `biff` | Team communication CLI and MCP server |
| [`punt-quarry`](https://pypi.org/project/punt-quarry/) | `quarry` | Local semantic search CLI and MCP server |
| [`punt-vox`](https://pypi.org/project/punt-vox/) | `vox` | Text-to-speech and music engine |
| [`punt-lux`](https://pypi.org/project/punt-lux/) | `lux` | Visual display server CLI and MCP server |
| [`punt-zspec`](https://pypi.org/project/punt-zspec/) | `z-spec` | Z specification toolkit CLI and MCP server |
