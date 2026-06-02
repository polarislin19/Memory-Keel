# Memory Keel

<p align="center">
  <strong>🧠 The lightweight memory scaffold that keeps AI agents from forgetting everything between sessions.</strong>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="CONTRIBUTING.md"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg" alt="Contributions welcome"></a>
</p>

---

## The Problem

You're building with an AI coding agent. Session one, you spend 20 minutes explaining your project. Session two, the agent remembers nothing. You repeat yourself. Again.

Every new session = starting from scratch. Context windows are short, project knowledge is scattered across README files, markdown docs, and your own head.

**The bottleneck isn't the model. It's memory.**

---

## The Solution

Memory Keel is a **file-based memory scaffold** — a directory template and a set of discipline rules that give your AI agent persistent project context across sessions.

```
New session starts
      │
      ▼
Agent opens memory-keel/INDEX.md     ← 1 minute to restore context
      │
      ▼
Agent knows which projects exist, their status, key constraints
      │
      ▼
Agent drills into project/product.md for details when needed
```

**Two layers:**

| Layer | What it is | When it's read |
|-------|-----------|---------------|
| **Index** | Lightweight summaries — one sentence per project, status, key facts | Every session start |
| **Materials** | Full project files — product specs, deployment, lessons learned | When deep work begins |

---

## Why This Works

- **Zero dependencies.** No database. No vector store. No API keys. Just a folder of markdown files.
- **Your tools already read files.** Claude Code, Codex CLI, OpenCode — they all have file access. Memory Keel plugs into what's already there.
- **Human-readable.** You can open any file in Notepad or VS Code and understand it. No black box.
- **Git-friendly.** Every change is a commit. History, blame, rollback — free with git.
- **Discipline over complexity.** The rules (what to write, when to update) matter more than the file format.

---

## Quick Start

### Option 1: Scaffold script

```bash
git clone https://github.com/polarislin19/Memory-Keel.git
cd memory-keel
./scripts/scaffold.sh my-project
```

### Option 2: Manual

Copy the `template/` directory into your project:

```bash
cp -r memory-keel/template/ my-project/memory-keel/
```

Then edit `INDEX.md` to list your projects, and fill in the files under each project directory.

### Next session

Tell your AI agent: *"Before we start, read `memory-keel/INDEX.md`."*

That's it.

---

## Architecture

```
memory-keel/
├── INDEX.md              ← Entry point. Lists all projects, key facts, reading rules.
└── project-name/
    ├── product.md        ← What, who, how, boundaries, pricing
    ├── deploy.md         ← Servers, domains, config, environment
    └── lessons.md        ← Mistakes made, fixes applied, rules added
```

Every project gets the same structure. Templates are provided for common scenarios: solo SaaS, multi-agent collaboration, content creation.

→ [Full architecture deep dive →](docs/architecture.md)
→ [Discipline rules →](docs/rules.md)

---

## When to Use Memory Keel

✅ **Good fit:**
- Building products with AI coding agents
- Solo developer or tiny team with multiple projects
- Want zero-ops, zero-cost persistence
- Already use git

⚠️ **Not a fit:**
- Need real-time memory updates between agents (use Mem0 or Letta)
- Want semantic search across millions of memories (use a vector DB)
- Building a chatbot that remembers user preferences (use Mem0 or Memori)

---

## Comparison

| | Memory Keel | Mem0 | Memoria | Aegis | Letta |
|---|---|---|---|---|---|
| **Approach** | File templates | Server + DB | Git-versioned DB | Postgres + pgvector | Git-backed DB |
| **Setup** | Copy folder | Install + configure | Install + configure | Docker + DB | Install + API |
| **Dependencies** | None | Python, SQLite/Postgres | Python, DB | Postgres, pgvector | Letta API |
| **Learning curve** | 5 minutes | Hours | Hours | Hours | Hours |
| **Best for** | Solo/small team with AI agents | Production chatbots | Versioned memory | Multi-agent enterprise | Letta ecosystem |

Memory Keel doesn't replace these tools — it sits at the *opposite end* of the spectrum. When you don't want to run a server, manage a database, or pay for an API, but you still need your agent to remember.

---

## Real-World Origins

Memory Keel was extracted from a production multi-agent system managing several SaaS products. The original system ran for months, survived dozens of context window resets, and proved that **structured markdown + discipline > complex infrastructure** for this use case.

Every rule in `docs/rules.md` was learned the hard way. Every template in `template/` was battle-tested.

---

## Getting Help

- 📖 [Getting Started Guide](docs/getting-started.md)
- 📐 [Architecture Deep Dive](docs/architecture.md)
- 📋 [Discipline Rules](docs/rules.md)
- ❓ [FAQ](docs/faq.md)
- 🐛 [Issue Tracker](https://github.com/polarislin19/Memory-Keel/issues)

---

## Contributing

Memory Keel is open to contributions. Found a missing scenario? Have a rule that saved you? Open an issue or PR.

→ [Contributing Guide](CONTRIBUTING.md)

---

## License

MIT — see [LICENSE](LICENSE) for details.

---

<p align="center">
  <strong>Built by Polo Lin</strong><br>
  <sub>If this saved you from repeating yourself to your agent, consider ⭐ the repo.</sub>
</p>
