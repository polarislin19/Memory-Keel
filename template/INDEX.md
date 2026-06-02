# Memory Keel — INDEX

> Entry point for your AI agent. Read this first every session.

## Purpose

This directory holds lightweight summaries of all projects your AI agent needs to remember across sessions. It is NOT a replacement for full project docs — it's the index that tells the agent where to look.

**Rule**: This file stays short. One sentence per project. Link to project subdirectories for details.

---

## Projects

| Project | Status | What | Key Constraint |
|---------|--------|------|----------------|
| [project-alpha](./project-alpha/) | 🟢 Active | SaaS product — compliance self-assessment tool | Never expose real customer data |
| [project-beta](./project-beta/) | 🟡 Paused | Content pipeline for social media | Zero-cost operations only |
| [project-gamma](./project-gamma/) | 🔴 Planning | Browser extension — workflow automation | Must work offline |

> **Replace the above with your actual projects.** Delete what doesn't apply. Add what does.

---

## Shared Knowledge

Some knowledge spans multiple projects. Keep it in a `shared/` directory:

- `shared/servers.md` — Server inventory, IPs, SSH config
- `shared/lessons.md` — Mistakes that apply to all projects
- `shared/strategy.md` — Business decisions that affect everything

---

## Reading Rules

When an AI agent starts a new session, tell it:

1. **Read this INDEX first** — understand what projects exist and their status
2. **When working on a specific project** — read that project's files before touching code
3. **When in doubt, check the project files first** — don't rely on training data or memory
4. **Project files > this index** — if there's a conflict, the project's own files are authoritative
5. **Keep this index updated** — after major changes, update statuses and summaries here

## Writing Rules

After any significant change to a project:

1. **Update the project's own files immediately** — before moving to the next task
2. **Update this INDEX** — if project status, scope, or constraints changed
3. **Add lessons to `shared/lessons.md` or the project's `lessons.md`** — mistakes are only useful if written down

## Anti-Patterns

❌ Writing everything in one giant file
❌ Letting the index get stale while project files are current
❌ Using this as the sole source of truth — it's a map, not the territory
❌ Storing secrets, tokens, or personal data anywhere in this directory

---

## How to Start a New Project

```bash
./scripts/scaffold.sh my-new-project
```

Or manually:

```bash
cp -r template/project-alpha/ my-new-project/
# Edit the files to match your project
# Add the project to this INDEX
```
