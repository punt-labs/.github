# Punt Labs

Grounding and refining agentic coding with formal methods.

## About

AI removes the time penalty from formal specifications, architecture decision records, and comprehensive tests. When the cost of rigor drops to near zero, the calculus changes. We build tools that bring that rigor to every stage of the development flow — product discovery, formal specification, code analysis, knowledge management, and team coordination. Most work as standalone CLIs and as Claude Code plugins. With some fun thrown in.

Our design standards and project guide live in [punt-kit](https://github.com/punt-labs/punt-kit). Our [tenets](https://www.punt-labs.com/tenets) document where we think agentic coding is heading.

## Projects

### Grounding & Formal Methods

- [**PR/FAQ**](https://github.com/punt-labs/prfaq) `Claude Code` — Structured product discovery using Amazon's Working Backwards process. Eight specialized agents, simulated review meetings, compiled PDF output. Grounding for *what* to build.
- [**Z Spec**](https://github.com/punt-labs/z-spec) `Claude Code` — Formal Z specifications for stateful systems. Extract specs from existing code (`code2model`) or generate code from specs (`model2code`). Type-check with fuzz, animate and model-check with ProB. Grounding for *how* to build it.
- **Refactory** — Code refactoring guided by formal analysis. In development.

### Developer Tools

- [**Quarry**](https://github.com/punt-labs/quarry) `CLI` `Claude Code` `Claude Desktop` `macOS` — Local semantic search across your documents. 30+ formats, AST-level code parsing, offline. Works as a standalone CLI, an MCP server, or through the [menu bar app](https://github.com/punt-labs/quarry-menubar).
- [**Biff**](https://github.com/punt-labs/biff) `CLI` `Claude Code` — Team communication resurrecting BSD Unix vocabulary (`who`, `finger`, `write`, `plan`) over a NATS relay. Humans and agents show up side by side. Serious coordination, retro charm.
- [**TTS**](https://github.com/punt-labs/tts) `CLI` `Claude Code` — Text-to-speech engine with multiple backend support (ElevenLabs, AWS Polly, OpenAI). Voice management, streaming output, and ensemble mode for multi-voice narration. CLI + MCP server.
- [**punt-kit**](https://github.com/punt-labs/punt-kit) `CLI` `Python` — Org standards, shared tooling, and project scaffolding. The `punt` CLI.

### Applications

Built with our tools — examples of the workflow in practice.

- [**LangLearn**](https://github.com/punt-labs/langlearn) `CLI` `Claude Desktop` — Language learning platform built on [langlearn-tts](https://github.com/punt-labs/langlearn-tts) (speech in 70+ languages with 28 AI tutor personas) and [langlearn-types](https://github.com/punt-labs/langlearn-types) (shared interfaces). Each component works as a standalone CLI or MCP server.
- [**Koch Trainer**](https://github.com/punt-labs/koch-trainer-swift) `iOS` — Morse code trainer using the Koch method. Built from a formal [Z Spec](https://github.com/punt-labs/z-spec) specification — the design-to-code workflow in action.
- [**Dungeon**](https://github.com/punt-labs/dungeon) `Claude Code` — Text adventure where Claude is the game master. No code runs, only prompts. Fun is a feature.

## Install Everything

All CLIs and all Claude Code plugins in a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/punt-labs/punt-kit/caf5df8/install-all.sh | sh
```

## PyPI Packages

All Python packages are published under the `punt-` prefix on [PyPI](https://pypi.org):

| Package | CLI | Description |
|---------|-----|-------------|
| [`punt-kit`](https://pypi.org/project/punt-kit/) | `punt` | Project scaffolding and standards tooling |
| [`punt-biff`](https://pypi.org/project/punt-biff/) | `biff` | Team communication CLI and MCP server |
| [`punt-quarry`](https://pypi.org/project/punt-quarry/) | `quarry` | Local semantic search CLI and MCP server |
| [`punt-tts`](https://pypi.org/project/punt-tts/) | `tts` | Text-to-speech engine CLI and MCP server |
| [`punt-langlearn-tts`](https://pypi.org/project/punt-langlearn-tts/) | `langlearn-tts` | Language learning TTS CLI and MCP server |
| [`punt-langlearn-types`](https://pypi.org/project/punt-langlearn-types/) | `langlearn-types` | Shared interfaces for LangLearn tooling |
