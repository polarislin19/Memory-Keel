# FAQ

## Is this really enough? Just markdown files?

Yes — if you follow the rules. The files are the easy part. The discipline of writing to them consistently is what makes it work. Hundreds of production incidents across AI agent teams boil down to the same root cause: "we didn't write it down." Memory Keel makes writing it down the default.

---

## Won't the files get too large?

Not if you use the two-layer design correctly. The INDEX stays short (one table). Project files grow slowly — `lessons.md` is usually the longest. When a file consistently exceeds ~200 lines, split it. See [architecture.md](architecture.md#when-to-extend) for guidelines.

---

## My agent already has a memory feature. Why use this?

Most agent memory features are:
- **Opaque** — you can't see or edit what the agent remembers
- **Non-portable** — tied to one tool or platform
- **Unreliable** — the agent decides what to remember, and it often misses critical details

Memory Keel is transparent (you can read every file), portable (works with any agent that reads files), and deterministic (you control what's written).

---

## How is this different from a README?

A README is written for humans. It's what you want a new teammate to know about the project. Memory Keel files are written for AI agents — they include operational details, constraints, and lessons that a human might not need but an agent absolutely does (e.g., "the webhook field is `meta.webhook_id`, not `meta.event_id`").

---

## Can I use this with multiple agents?

Yes. Memory Keel is just files. Multiple agents can read and write the same files. However, you'll need to manage conflicts — git handles this well. For teams with 3+ agents actively writing to the same files, consider a more structured solution like Mem0 or Letta.

---

## What if I forget to update the files?

Your agent will drift. It'll make decisions based on stale information. The next session will feel like starting over. This is why Rule 3 ("Write before moving on") is the most important rule. Build the habit.

---

## Do I commit the memory-keel directory to git?

Yes. It's part of your project. Every update is a commit with history. This also means:
- You can see when a decision was made and why (git blame)
- You can revert if a change was wrong
- New team members get full context from day one

Just make sure you've followed Rule 5 (no secrets in markdown) before committing.

---

## What if I have 20 projects?

Memory Keel is designed for 3-8 projects. Beyond that, the INDEX table becomes unwieldy. For large portfolios, consider:
- One INDEX per project group
- A meta-INDEX that links to per-group INDEX files
- A different tool (Mem0, Letta) for large-scale memory management

---

## Can I add more file types to a project?

Yes. The three-file template (product, deploy, lessons) is a starting point. Common additions:
- `pricing.md` — pricing tiers, discount logic, payment provider details
- `marketing.md` — channels, campaigns, content calendar
- `api.md` — endpoints, auth, rate limits
- `incidents.md` — postmortems for major outages
- `decisions.md` — architecture decision records (ADRs)

Add files when the existing ones are consistently overflowing. Don't add files preemptively — empty files are noise.

---

## What's the difference between `shared/lessons.md` and a project's `lessons.md`?

- **Project `lessons.md`**: lessons specific to that project. "The webhook field name is wrong" only matters for Project Alpha.
- **`shared/lessons.md`**: lessons that apply across projects. "Always `get_dns` before `set_dns`" applies everywhere.

When in doubt, put it in the project file first. Promote to shared only when the same lesson recurs across multiple projects.

---

## Is this compatible with my agent tool?

If your AI coding agent can read files from disk, Memory Keel works. Tested with:
- Claude Code
- OpenAI Codex CLI
- OpenCode
- Cursor Agent
- Windsurf
- Aider
- GitHub Copilot Coding Agent

If your agent is API-only with no file access, Memory Keel won't work directly. You'd need to copy the file contents into the prompt manually — which defeats the purpose.

---

## Why "Keel"?

A keel is the structural backbone of a ship — the central timber that runs along the bottom and holds everything together. Without it, the ship breaks apart. Memory Keel is the structural backbone for your agent's project knowledge — without it, context breaks apart between sessions.
