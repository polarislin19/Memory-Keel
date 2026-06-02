# Example: Solo SaaS Product

This is an INDEX template for a solo developer shipping paid SaaS products with AI agents. Copy this to your `memory-keel/INDEX.md` and customize.

---

## Index

| Project | Status | What | Key Constraint |
|---------|--------|------|----------------|
| [analytics-tool](./analytics-tool/) | 🟢 Live | B2B analytics dashboard, $49/mo | Never expose raw customer data |
| [pdf-generator](./pdf-generator/) | 🟢 Live | Report generation API, pay-per-use | Max response time 5s |
| [chrome-extension](./chrome-extension/) | 🟡 Paused | Workflow automation extension | Must work fully offline |
| [landing-templates](./landing-templates/) | 🔴 Idea | Notion-to-landing-page tool | Verify Market first |

---

## Product File Template

For each project, `product.md` should cover:

```markdown
# [Product Name]

## Elevator Pitch
One sentence. What, for whom, why different.

## Target Users
Who pays? What do they do? How many are there?

## Product Boundaries
In scope / out of scope. Be ruthless. Every "yes" is a maintenance burden.

## Tech Stack
Language, framework, hosting, database, third-party services.

## Architecture
Simple diagram (ASCII or Mermaid). Key services and their ports.

## Pricing
- Model: subscription / one-time / usage-based
- Price point and justification (what competitor sets the anchor?)

## Payment
- Provider (Stripe, Lemon Squeezy, Paddle)
- Implementation notes (webhooks, idempotency, refunds)

## Key Decisions
Irreversible or expensive-to-change choices. Why we made them.

## Current Status
🟢 Live / 🟡 Paused / 🔴 Planning

## Next Steps
Ordered list. What happens next and why.
```

---

## Deploy File Template

```markdown
# [Product Name] — Deploy

## Server
Provider, region, OS, specs.

## Services
Table: service name, port, managed by, status.

## Domains & DNS
Table: domain, DNS provider, notes.

## SSL
Provider, renewal method.

## Environment
All config that isn't code. .env template location.

## Deploy Process
Exact commands. No ambiguity.

## Backup
What, where, how often, restore procedure.

## Monitoring
Uptime, logs, alerts.

## Known Issues
Things that break. Warning signs. Temporary workarounds.
```

---

## Lessons File Template

```markdown
# [Product Name] — Lessons

### [YYYY-MM] — One-line summary
**What happened:**
**Root cause:**
**Impact:**
**Fix:**
**Prevention:**
```

Every lesson must have a prevention rule. Without it, the lesson is incomplete.

---

## Shared Files

### `shared/servers.md`
Inventory of all servers across projects. Avoids "which IP is the analytics DB on?" confusion.

### `shared/lessons.md`
Mistakes that apply to ALL projects. Example: "Never `set_dns` without `get_dns` first."

### `shared/payment.md`
Payment provider details shared across products: webhook format, refund policy, rate limits.
