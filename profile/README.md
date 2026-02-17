# Punt Labs

Tools for engineers who work with AI. Open source. Quality-focused.

## About

Punt Labs builds software that keeps engineers in flow — Claude Code plugins, MCP servers, and companion apps that extend AI-assisted workflows without forcing a context switch. Our name comes from punting in Oxford: a casual way to give something a go.

## Projects

### Claude Code Plugins

- [**PR/FAQ**](https://github.com/punt-labs/prfaq) — Amazon's Working Backwards process in the terminal. Generate, review, stress-test, and iterate on product discovery documents with eight specialized agents, simulated review meetings, and compiled PDF output.
- [**Z Spec**](https://github.com/jmf-pobox/claude-z-spec-plugin) — Create, validate, and test formal Z specifications for stateful systems. Guided setup for fuzz and ProB, with type-checking and model-checking from Claude Code.

### MCP Servers

- [**Biff**](https://github.com/punt-labs/biff) — Team communication for engineers who never leave the terminal. Resurrects the BSD Unix communication vocabulary (`who`, `finger`, `write`, `plan`) as MCP-native slash commands over a NATS relay. Humans and agents show up side by side.
- [**Quarry**](https://github.com/jmf-pobox/quarry-mcp) — Local semantic search across your documents. Index PDFs, images, spreadsheets, source code, and 30+ formats. Search by meaning, not keywords. Runs entirely offline — no API keys, no cloud accounts.
- [**LangLearn TTS**](https://github.com/jmf-pobox/langlearn-tts-mcp) — Gives Claude the ability to speak. Pronounce words, generate audio flashcards, or run full language lessons with audio in 70+ languages. Ships with 28 AI tutor personas across seven languages and four levels.

### Native Apps

- [**Quarry Menu Bar**](https://github.com/jmf-pobox/quarry-menubar) — macOS menu bar companion for Quarry. Search your indexed documents from anywhere with a keyboard shortcut. Pure SwiftUI, no dependencies.
- [**Koch Trainer**](https://github.com/punt-labs/koch-trainer-swift) — iOS Morse code trainer using the Koch method. Receive/send training, QSO simulation, spaced repetition, and vocabulary practice for amateur radio operators. Formally specified using [Z Spec](https://github.com/jmf-pobox/claude-z-spec-plugin).
