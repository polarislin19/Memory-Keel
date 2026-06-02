# Example: Multi-Agent Collaboration

This is an INDEX template for teams using multiple AI agents to build and maintain projects. Agents may run on different machines, work in parallel, or specialize in different roles (coding, review, deployment).

---

## Index

| Project | Status | Agents | Key Constraint |
|---------|--------|--------|----------------|
| [platform](./platform/) | 🟢 Live | agent-dev, agent-review, agent-ops | agent-review must approve before agent-ops deploys |
| [content-site](./content-site/) | 🟡 Paused | agent-writer, agent-dev | All content reviewed by human before publish |

---

## Agent Roles File

Add a `roles.md` to each project with 2+ agents:

```markdown
# Agent Roles

## agent-dev
- Responsibility: Write code, fix bugs, implement features
- Authority: Can modify any file in `src/`, `tests/`, `config/`
- Cannot: Deploy, modify payment code, access secrets
- Must: Run tests before marking task complete

## agent-review
- Responsibility: Review agent-dev's changes for security, correctness, style
- Authority: Can read all files, write review comments
- Cannot: Modify code directly
- Must: Approve or reject within 30 minutes

## agent-ops
- Responsibility: Deploy approved changes, monitor services
- Authority: Can restart services, read logs, access `.env`
- Cannot: Modify code
- Must: Verify health check after every deploy
```

---

## Collaboration Rules File

Add a `collab.md` to each multi-agent project:

```markdown
# Collaboration Rules

## Communication
- Agents communicate via this memory-keel directory — not chat, not email
- agent-dev writes "Ready for review" in the task's status
- agent-review writes "Approved" or "Rejected (see: issues.md)"
- agent-ops deploys only after seeing "Approved"

## Task Lifecycle
1. Task created → agent-dev starts
2. Code written + tests pass → agent-dev marks "Ready for review"
3. agent-review reads changes → approves or rejects with reasons
4. Approved → agent-ops deploys → verifies health → marks "Done"
5. Rejected → agent-dev fixes → back to step 3

## Conflict Resolution
- If two agents disagree on a technical decision → escalate to human
- If an agent is stuck for >40 minutes → log what's blocking in `blockers.md`
- Never override another agent's "Rejected" status without discussion

## Shared State
- `tasks.md` — current task board with status per agent
- `blockers.md` — anything preventing progress
- `decisions.md` — resolved disagreements and why

## Anti-Patterns
- ❌ Agent A modifies code while Agent B is reviewing it
- ❌ Skipping review because "it's a small change"
- ❌ Deploying without health check verification
- ❌ Not updating status after completing a task
```

---

## Additional Project Files

Multi-agent projects benefit from extra files beyond the three core ones:

| File | Purpose |
|------|---------|
| `roles.md` | Who does what, authority boundaries |
| `collab.md` | Communication protocol, task lifecycle |
| `tasks.md` | Current task board |
| `blockers.md` | Active blockers and who's handling them |
| `decisions.md` | Resolved disagreements and rationale |
| `incidents.md` | Postmortems — what broke, who caught it, how it was fixed |

Start with the three core files (product, deploy, lessons). Add these as your agent team grows and coordination becomes the bottleneck.
