# Project Alpha — Lessons Learned

> Mistakes are tuition. Write them down so you (and your AI agent) don't pay twice.

## Format
```
### [Date] — [One-line summary]
**What happened:** [Brief description]
**Root cause:** [Why it happened]
**Impact:** [Users affected, money lost, time wasted]
**Fix:** [What we did]
**Prevention:** [What we changed to prevent recurrence]
```

---

## Lessons

### 2026-05 — Payment webhook: wrong event_id field
**What happened:** Webhook endpoint returned 400 for all Lemon Squeezy events.
**Root cause:** Code was reading `meta.event_id` — the correct field is `meta.webhook_id`.
**Impact:** ~15 failed payment confirmations. Reports not delivered. Two refund requests.
**Fix:** Changed field reference and redeployed.
**Prevention:** Added inline comment in webhook handler documenting all field names. Wrote a test that replays real webhook payloads.

### 2026-04 — Redis OOM during traffic spike
**What happened:** Redis hit maxmemory limit during a Product Hunt launch.
**Root cause:** No memory cap configured. Session keys accumulated without TTL.
**Impact:** ~200 visitors saw 500 errors during peak hour.
**Fix:** Set `maxmemory 256mb` and `maxmemory-policy allkeys-lru`. Added TTL to all session keys.
**Prevention:** Load test before any public launch. Redis `INFO memory` check in health endpoint.

### 2026-03 — PDF generation: unescaped user input
**What happened:** A user entered `<script>alert(1)</script>` in a text field. PDF rendering engine interpreted it.
**Root cause:** WeasyPrint processes raw HTML — user input was not sanitized before embedding.
**Impact:** Single user, caught during testing. No production exposure.
**Fix:** Added `html.escape()` to all user-provided strings before PDF generation.
**Prevention:** Security checklist item: "Escape user input before PDF/email/html rendering."

### 2026-02 — DNS migration: lost all records
**What happened:** Used a "set all DNS" API call without first reading existing records. Overwrote MX, TXT, and CNAME records.
**Root cause:** The API's `set_dns` method replaces the entire zone — it's not additive.
**Impact:** Email down for 4 hours. Calendar invites bounced. DNS propagation delay extended recovery.
**Fix:** Manually reconstructed DNS records from backups.
**Prevention:** Always `get_dns` → modify → `set_dns`. Never call `set_dns` without reading first. Document all DNS records in this file.

### 2026-01 — API key leaked in commit
**What happened:** Committed `.env` file to a public repo. API key exposed for ~20 minutes.
**Root cause:** `.env` was not in `.gitignore`. Force of habit: `git add .`
**Impact:** Key rotated within 30 minutes. No unauthorized usage detected (provider audit log confirmed).
**Fix:** Rotated key. Added `.env` to `.gitignore`. Ran `git filter-branch` to purge history.
**Prevention:** `.gitignore` template includes `.env`. Pre-commit hook scans for common secret patterns.
