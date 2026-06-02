# Architecture: The Two-Layer Design

Memory Keel is built on a single insight: **AI agents don't need a database. They need a map.**

---

## The Problem with Flat Memory

Most teams start the same way — a single `MEMORY.md` or `CONTEXT.md` file. The agent reads it at the start of every session.

This works for two weeks. Then:

- The file grows to 500 lines. Every session, the agent reads all 500 lines. Most of it is irrelevant to today's task.
- Context window waste: 80% of memory tokens are about projects you're not touching right now.
- Update friction: adding a lesson to one project means editing a monolithic file. Merge conflicts happen.
- No hierarchy: everything is equally important. The agent can't distinguish "server is down" from "we considered using Postgres once."

---

## The Two-Layer Solution

```
Layer 1: INDEX (Lightweight)
─────────────────────────────
Read every session. ~1 minute.

┌─────────────────────────────────┐
│ Project Alpha — 🟢 Live        │
│   SaaS compliance tool         │
│   Key: no user accounts        │
│                                │
│ Project Beta — 🟡 Paused       │
│   Content pipeline             │
│   Key: zero-cost only          │
│                                │
│ Project Gamma — 🔴 Planning    │
│   Browser extension            │
│   Key: offline-first           │
└─────────────────────────────────┘

         │
         │ Agent picks a project
         ▼

Layer 2: Project Files (Detailed)
─────────────────────────────────
Read only when working on that project.

project-alpha/
├── product.md    ← What, boundaries, decisions
├── deploy.md     ← Servers, domains, config
└── lessons.md    ← Mistakes, fixes, rules
```

### Layer 1: The Index

**Purpose:** Context restoration. In under a minute, the agent knows:
- What projects exist
- Their current status (active/paused/planning)
- One critical constraint per project
- Where to find details

**Properties:**
- Short — fits in one screen
- Scannable — table format, not paragraphs
- Actionable — tells the agent what to read next

**Example:** The agent sees "Project Alpha 🟢 Live — key constraint: never expose customer data." It knows: this project is active, I should be careful about data handling, and full details are in `project-alpha/`.

### Layer 2: Project Files

**Purpose:** Deep work. Contains everything needed to make decisions and write code.

Each project gets three files by default:

| File | Answers the question |
|------|---------------------|
| `product.md` | What are we building? For whom? What are the boundaries? |
| `deploy.md` | Where does it run? How do I deploy? What breaks? |
| `lessons.md` | What went wrong? What did we learn? What rules exist? |

**Properties:**
- Structured — consistent sections across projects
- Authoritative — the agent trusts these files over training data
- Updated immediately — after every significant change, before moving to the next task

---

## Why Not a Database?

Memory tools like Mem0, Memoria, and Letta use databases (SQLite, Postgres, vector stores) for good reasons:
- Semantic search across thousands of memories
- Real-time updates between agents
- Structured querying and filtering

Memory Keel deliberately avoids these. For a solo developer or tiny team with 3-5 projects:

- **You already have a file system.** Adding a database is operational overhead.
- **You already use git.** File-based memory inherits version control, history, and blame for free.
- **Your agent already reads files.** Claude Code, Codex, OpenCode — they all open markdown files natively. A database requires API integration.
- **You can read it.** Open any `.md` file in any editor. No query language, no admin panel.

The tradeoff is real: you can't do semantic search across 10,000 memories. But for 3-5 projects with structured files, you don't need to.

---

## The Discipline Layer

The files are the easy part. The hard part is **writing to them consistently.**

Memory Keel's architecture includes a set of rules that govern how files are read and written:

```
Agent finishes a task
        │
        ▼
Did anything change? ──No──▶ Done
        │
       Yes
        │
        ▼
Update project files FIRST
        │
        ▼
Did project status/scope change? ──No──▶ Done
        │
       Yes
        │
        ▼
Update INDEX
```

Without this discipline, the memory system decays. The index goes stale. Lessons are lost. The agent starts making decisions on outdated information.

→ [Full discipline rules →](rules.md)

---

## Design Principles

1. **Readability over structure.** A human should understand any file in 30 seconds. Markdown, not YAML. Tables, not nested objects.
2. **Minimum viable surface.** Three files per project. Add more only when the existing files are consistently overflowing.
3. **Update-first, not write-later.** Files are updated before the next task starts, not "when I have time."
4. **The index is a map, not the territory.** It points to details. It doesn't contain them.
5. **Secrets live elsewhere.** `.env` files, secret managers, environment variables. Never in markdown.

---

## When to Extend

Memory Keel starts minimal. You'll know it's time to add files when:

- **`product.md` is too long** → Split into `product.md` + `pricing.md` + `competitors.md`
- **Deploy is complex** → Split into `deploy.md` + `monitoring.md` + `incidents.md`
- **Lessons are piling up** → Split into `lessons/` by topic or date
- **Cross-project concerns emerge** → Add `shared/` directory
- **Team grows beyond 2-3 people** → Add `roles.md` or `handoff.md`

The structure is a starting point, not a cage.
