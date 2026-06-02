# Getting Started in 5 Minutes

## Prerequisites

- A project you're working on with an AI coding agent (Claude Code, Codex, OpenCode, etc.)
- Git (optional but recommended)
- 5 minutes

---

## Step 1: Clone the Template

```bash
git clone https://github.com/polarislin19/Memory-Keel.git
```

Or download and extract the ZIP from the GitHub releases page.

---

## Step 2: Scaffold Your First Project

```bash
cd memory-keel
./scripts/scaffold.sh my-project
```

This creates:
```
my-project/
├── product.md
├── deploy.md
└── lessons.md
```

Move it into your actual project directory:

```bash
cp -r my-project/ /path/to/your-project/memory-keel/
```

Or keep it separate — whatever fits your workflow.

---

## Step 3: Create Your Index

Copy the template:

```bash
cp template/INDEX.md /path/to/your-project/memory-keel/INDEX.md
```

Edit it. Replace the example projects with your real ones:

```markdown
| Project | Status | What | Key Constraint |
|---------|--------|------|----------------|
| [my-saas](./my-saas/) | 🟢 Active | B2B analytics dashboard | Never expose raw customer data |
| [blog-tool](./blog-tool/) | 🟡 Paused | SEO content pipeline | All API calls must be free-tier |
```

---

## Step 4: Fill in Your Project Files

### `product.md`
Fill in: product name, what it does, who it's for, tech stack, boundaries, pricing, key decisions.

Keep it factual. This is what your agent needs to know, not a marketing page.

### `deploy.md`
Fill in: server details, domains, services, deploy process, backup strategy.

Redact IPs and credentials. Use placeholders: `[redacted]`, `[your-provider]`.

### `lessons.md`
Start with one lesson — the last thing that broke.

Even one entry is better than an empty file. It shows your agent that this is where mistakes are recorded.

---

## Step 5: Tell Your Agent About It

In your agent's session prompt, project rules file, or initial instruction, add:

```
Before we start working, read memory-keel/INDEX.md.
When working on a specific project, read that project's files in memory-keel/ first.
After any significant change, update the relevant memory-keel files.
```

That's it. Next session, your agent will know what's going on.

---

## Verifying It Works

Start a **fresh session** with your agent. Don't give it any context. Just say:

> "Read memory-keel/INDEX.md and tell me what projects we're working on."

If the agent correctly lists your projects, knows their status, and can find details in the project files, Memory Keel is working.

---

## What's Next

- Read [the discipline rules](rules.md) — this is the part that makes it stick
- Read [the architecture deep dive](architecture.md) — understand why this design works
- Browse [example templates](../examples/) for different project types
- Read [the FAQ](faq.md) for common questions

---

## Quick Reference

```
Session start → agent reads INDEX.md
Working on project → agent reads project/*.md
Finished task → update project files → update index if needed
Committing → grep for secrets first
Next session → repeat
```
