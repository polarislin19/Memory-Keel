# Project Alpha — Product

## Elevator Pitch
A self-assessment tool that helps SaaS founders identify compliance gaps before regulators or enterprise customers ask. Web-based, one-off purchase, no subscription.

## Target Users
- Solo founders and small SaaS teams (1-10 people)
- Preparing for their first enterprise customer or SOC 2 audit
- Need answers fast, not a consultant engagement

## Product Boundaries

**In scope:**
- Interactive questionnaire mapped to regulatory frameworks
- Gap analysis report (PDF) with actionable recommendations
- Single-session, no account required

**Out of scope:**
- Legal advice or certification
- Ongoing monitoring or compliance management
- Custom consulting or manual review

## Tech Stack
- Backend: Python (FastAPI) on port 8001
- Frontend: Static HTML/CSS/JS, served by Nginx
- Database: None — session state in Redis, reports generated on-the-fly
- PDF generation: WeasyPrint or wkhtmltopdf

## Architecture
```
Browser → Nginx → Static Frontend
                → /api/* → FastAPI Backend → Redis (session)
                                            → WeasyPrint (PDF report)
```

## Pricing
- Single price: $29.99 one-time
- No tiers, no subscription
- Discount logic: time-based launch offer (e.g., first 30 days at $14.99)

## Payment
- Provider: [e.g., Stripe, Lemon Squeezy]
- Model: One-time payment → generate report → email report
- Refund policy: 48-hour window

## Key Decisions
- No user accounts → session-based access via unique report URL
- Reports expire after 90 days (privacy + storage hygiene)
- No LLM in the pipeline (deterministic rule engine)

## Current Status
🟢 Live — accepting payments, generating reports.

## Next Steps
- Add second regulatory framework
- A/B test pricing page
- Add testimonial section to landing page
