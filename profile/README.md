# Punt Labs

Grounding and refining agentic coding with formal methods.

## About

Decades of computer science and software engineering research — structured product discovery, formal methods, and behavior-preserving transformations — have always worked. They were just too expensive. AI removes the time penalty. We apply that research to ground and refine agentic coding. With some fun thrown in.

Our design standards and project guide live in [punt-kit](https://github.com/punt-labs/punt-kit). Our [tenets](https://www.punt-labs.com/about#tenets) document where we think agentic coding is heading.

## Projects

### Grounding & Formal Methods

- [**PR/FAQ**](https://github.com/punt-labs/prfaq) `Claude Code` — Structured product discovery using Amazon's Working Backwards process. Eight specialized agents, simulated review meetings, compiled PDF output. Grounding for *what* to build.
- **Use Cases** — Guided use-case specification using Jacobson-Cockburn Use-Case Foundation v1.1. In development.
- [**Z Spec**](https://github.com/punt-labs/z-spec) `Claude Code` — Formal Z specifications for stateful systems. Extract specs from existing code (`code2model`) or generate code from specs (`model2code`). Type-check with fuzz, animate and model-check with ProB. Grounding for *how* to build it.

### Developer Tools

- [**Quarry**](https://github.com/punt-labs/quarry) `CLI` `Claude Code` `Claude Desktop` `macOS` — Local semantic search across your documents. 30+ formats, AST-level code parsing, offline. Works as a standalone CLI, an MCP server, or through the [menu bar app](https://github.com/punt-labs/quarry-menubar).
- **Refactory** — Deterministic, behavior-preserving refactoring. The AI decides what needs restructuring, Refactory executes on a parsed program model with formally defined preconditions. In development.
- [**Biff**](https://github.com/punt-labs/biff) `CLI` `Claude Code` — Team communication resurrecting BSD Unix vocabulary (`who`, `finger`, `write`, `plan`) over a NATS relay. Humans and agents show up side by side. Serious coordination, retro charm.
- [**Vox**](https://github.com/punt-labs/tts) `CLI` `Claude Code` — Text-to-speech engine with multi-provider support (ElevenLabs, OpenAI, AWS Polly). Spoken notifications, chimes, and arbitrary speech synthesis. Opt-in only.
- [**punt-kit**](https://github.com/punt-labs/punt-kit) `CLI` `Python` — Org standards, shared tooling, and project scaffolding. The `punt` CLI.

### Test Bed

Real projects where we discover what works and what doesn't.

- [**Koch Trainer**](https://github.com/punt-labs/koch-trainer-swift) `iOS` — Morse code trainer using the Koch method. Built from a formal [Z Spec](https://github.com/punt-labs/z-spec) specification — the design-to-code workflow in action.
- [**langlearn-tts**](https://github.com/punt-labs/langlearn-tts) `Claude Desktop` — An AI language tutor that speaks to you. 28 tutor personas across 7 languages and 4 levels. Built on [Vox](https://github.com/punt-labs/tts).
- [**LangLearn**](https://github.com/punt-labs/langlearn) — The complete platform wiring langlearn-tts, [langlearn-anki](https://github.com/punt-labs/langlearn-anki), and [langlearn-imagegen](https://github.com/punt-labs/langlearn-imagegen) into one pipeline. In development.
- [**Dungeon**](https://github.com/punt-labs/dungeon) `Claude Code` — Text adventure where Claude is the game master. No code runs, only prompts. Built to experiment with UX concepts for Claude Code experiences.

## Install Everything

All CLIs and all Claude Code plugins in a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/punt-labs/punt-kit/146870e/install-all.sh | sh
```

## PyPI Packages

All Python packages are published under the `punt-` prefix on [PyPI](https://pypi.org):

| Package | CLI | Description |
|---------|-----|-------------|
| [`punt-kit`](https://pypi.org/project/punt-kit/) | `punt` | Project scaffolding and standards tooling |
| [`punt-biff`](https://pypi.org/project/punt-biff/) | `biff` | Team communication CLI and MCP server |
| [`punt-quarry`](https://pypi.org/project/punt-quarry/) | `quarry` | Local semantic search CLI and MCP server |
| [`punt-tts`](https://pypi.org/project/punt-tts/) | `tts` | Vox — text-to-speech engine CLI and MCP server |
| [`punt-langlearn-tts`](https://pypi.org/project/punt-langlearn-tts/) | `langlearn-tts` | Language learning TTS CLI and MCP server |
| [`punt-langlearn-types`](https://pypi.org/project/punt-langlearn-types/) | `langlearn-types` | Shared interfaces for LangLearn tooling |
