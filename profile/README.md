# Punt Labs

Tools for engineers who build with AI. Open source. Quality-focused.

## About

Punt Labs builds software that keeps engineers in flow. Most of our tools work two ways: as standalone CLIs and as plugins or MCP servers inside Claude Code and Claude Desktop. Use them from the terminal or let your AI assistant use them for you. Our name comes from punting in Oxford: a casual way to give something a go.

Our design standards and project guide live in [punt-kit](https://github.com/punt-labs/punt-kit).

## Projects

### Product Planning

- [**PR/FAQ**](https://github.com/punt-labs/prfaq) `Claude Code` — Amazon's Working Backwards process in the terminal. Generate, review, stress-test, and iterate on product discovery documents with eight specialized agents, simulated review meetings, and compiled PDF output.

### Development

- [**Biff**](https://github.com/punt-labs/biff) `CLI` `Claude Code` — Team communication for engineers who never leave the terminal. Resurrects the BSD Unix communication vocabulary (`who`, `finger`, `write`, `plan`) as both CLI commands and MCP-native slash commands over a NATS relay. Humans and agents show up side by side.
- [**Quarry**](https://github.com/punt-labs/quarry) `CLI` `Claude Code` `Claude Desktop` `macOS` — Local semantic search across your documents. Index PDFs, images, spreadsheets, source code, and 30+ formats. Search by meaning, not keywords. Works as a standalone CLI, an MCP server, or through the [menu bar app](https://github.com/punt-labs/quarry-menubar). Runs entirely offline.
- [**Z Spec**](https://github.com/punt-labs/z-spec) `Claude Code` — Formal Z specifications for stateful systems. Extract specs from existing code (`code2model`) or generate code from specs (`model2code`). Type-check with fuzz, animate and model-check with ProB.
- [**TTS**](https://github.com/punt-labs/tts) `CLI` `Claude Code` — Text-to-speech engine with multiple backend support (ElevenLabs, AWS Polly, OpenAI). Works as a standalone CLI or MCP server. Features voice management, streaming output, and ensemble mode for multi-voice narration.

### Applications — Built with Our Tools

- [**LangLearn**](https://github.com/punt-labs/langlearn) `CLI` `Claude Desktop` — Language learning platform built on [langlearn-tts](https://github.com/punt-labs/langlearn-tts) (speech in 70+ languages with 28 AI tutor personas) and [langlearn-types](https://github.com/punt-labs/langlearn-types) (shared interfaces). Each component works as a standalone CLI or MCP server.
- [**Koch Trainer**](https://github.com/punt-labs/koch-trainer-swift) `iOS` — Morse code trainer using the Koch method. Receive/send training, QSO simulation, spaced repetition, and vocabulary practice for amateur radio operators. Built from a formal [Z Spec](https://github.com/punt-labs/z-spec) specification — an example of the design-to-code workflow our tools support.
- [**Dungeon**](https://github.com/punt-labs/dungeon) `Claude Code` — Text adventure prototype where Claude is the game master. No code runs, only prompts. Demonstrates what's possible with skills, MCP state management, and natural language as the parser.

### Infrastructure

- [**punt-kit**](https://github.com/punt-labs/punt-kit) `CLI` `Python` — Org standards, shared tooling, and project scaffolding. The `punt` CLI provides commands for creating new projects from templates. All Punt Labs projects follow the standards defined here.

## Claude Code Plugins

Install the [Punt Labs marketplace](https://github.com/punt-labs/claude-plugins) to get our Claude Code plugins:

```bash
curl -fsSL https://raw.githubusercontent.com/punt-labs/claude-plugins/0f68917/install.sh | sh
```

Available plugins: **biff** (team communication), **dungeon** (text adventure), **prfaq** (product discovery), **punt** (standards enforcement), **quarry** (semantic search), **tts** (text-to-speech), **z-spec** (formal specifications).

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
