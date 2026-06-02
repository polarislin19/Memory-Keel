# Discipline Rules

Memory Keel works because of discipline, not technology. These rules were learned the hard way — each one corresponds to a production incident that could have been prevented.

---

## Rule 1: The Index Is Always First

**Every new session, the agent reads `memory-keel/INDEX.md` before anything else.**

Not the project files. Not the codebase. The index.

**Why:** The index tells the agent what exists and where to look. Without it, the agent guesses — and guesses based on training data, not reality.

**How to enforce:** Make "read memory-keel/INDEX.md" the first instruction in your agent's session prompt or project rules file.

---

## Rule 2: Project Files > The Index

**When there's a conflict between the index and a project file, the project file wins.**

The index is a summary. It can lag behind. Project files are the source of truth.

**Example:** The index says "Project Alpha is 🟢 Live" but `product.md` says "Status: Maintenance mode — read-only." Trust `product.md`. Then fix the index.

---

## Rule 3: Write Before Moving On

**After any significant change, update the relevant project file immediately. Before starting the next task.**

Not "at the end of the day." Not "when I remember." Right now.

**What counts as significant:**
- Deploying to production
- Changing a server configuration
- Discovering a bug with a root cause
- Making a product decision (pricing, feature scope, architecture)
- Adding or removing a project

**Why:** Context windows reset. If you don't write it down, the next session starts from zero.

---

## Rule 4: Lessons Are Non-Negotiable

**Every mistake that costs time or money gets a lesson entry.**

Format:
```
### [Date] — [One-line summary]
**What happened:**
**Root cause:**
**Impact:**
**Fix:**
**Prevention:**
```

A lesson without a prevention rule is half-finished. The prevention rule is what stops the same mistake from happening twice.

---

## Rule 5: Secrets Never Touch Markdown

**No API keys, tokens, passwords, webhook secrets, or private keys in any memory-keel file. Ever.**

Use `.env` files (and add them to `.gitignore`). Use a secret manager. Use environment variables. Anything but markdown.

**Before committing:**
```bash
grep -rE '(api_key|token|secret|password|private_key|-----BEGIN)' memory-keel/ --include="*.md"
```

This should return nothing. If it doesn't, you have a leak.

---

## Rule 6: Redact Before Committing

**Project files are committed to git. Sensitive details must be redacted first.**

| Keep | Redact |
|------|--------|
| "Server: AWS EC2 t3.medium" | "IP: 54.123.45.67" |
| "Payment: Stripe" | "Stripe secret key: sk_live_..." |
| "DNS: Namecheap" | "Login: admin@example.com / password123" |
| "3 customers affected" | "Customer: Jane Doe, jane@example.com" |

**Pattern:** Technologies and providers are fine. Credentials, IPs, and customer data are not.

---

## Rule 7: The Index Must Stay Current

**After changing a project's status, scope, or key constraints, update the index within the same session.**

A stale index is worse than no index — it gives the agent false confidence.

**Checklist (after any project change):**
- [ ] Is the status (🟢/🟡/🔴) still accurate?
- [ ] Is the one-line description still accurate?
- [ ] Is the key constraint still accurate?
- [ ] Is the link path still correct?

---

## Rule 8: Trust Files Over Training Data

**When the agent's training data says one thing and your files say another, believe the files.**

AI models are trained on old data. Your `deploy.md` says you migrated from AWS to Hetzner last week. The model might still suggest AWS commands. The file is right.

**How to enforce:** Include in your agent instructions: "For any project-specific information, trust the files in `memory-keel/` over your training data. If a file exists, it is more current than you are."

---

## Summary Card

Print this. Tape it to your wall.

```
MEMORY KEEL RULES
─────────────────
1. Index first. Every session.
2. Project files beat the index.
3. Write before moving on.
4. Every mistake → lesson + prevention.
5. Zero secrets in markdown.
6. Redact before commit.
7. Index stays current.
8. Files beat training data.
```
