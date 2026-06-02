# Example: Content Creator

This is an INDEX template for creators managing content pipelines with AI agents — writing, editing, publishing, social media.

---

## Index

| Project | Status | What | Key Constraint |
|---------|--------|------|----------------|
| [novel-draft](./novel-draft/) | 🟢 Active | Sci-fi novel, target 80K words | Maintain character voice consistency |
| [blog-series](./blog-series/) | 🟢 Active | Technical blog, 2 posts/week | All code examples must be tested |
| [newsletter](./newsletter/) | 🟡 Paused | Weekly developer newsletter | Curate only — no original content yet |
| [video-scripts](./video-scripts/) | 🔴 Planning | YouTube tutorial series | Scripts must match thumbnail concepts |

---

## Project Structure for Content

Content projects don't have servers or deployments. Use a different set of files:

```
novel-draft/
├── overview.md       ← Genre, audience, word count target, tone
├── world.md          ← Setting, rules, timeline, factions
├── characters.md     ← Names, traits, arcs, relationships
├── chapters.md       ← Chapter list, status per chapter, word counts
├── style-guide.md    ← Voice rules, banned words, formatting conventions
└── lessons.md        ← What worked, what didn't, beta reader feedback
```

---

## Project Files Explained

### `overview.md`
```markdown
# Novel Draft — Overview

## Genre & Audience
Science fiction / space opera. Target: adult readers, comparable to The Expanse.

## Word Count
Target: 80,000 words. Current: 42,000 (52%).

## Tone
Grounded, technical but accessible. No info-dumps. Show the science through character experience.

## Schedule
Draft complete by [date]. Beta readers by [date].

## Constraints
- No AI-generated prose in final draft (outline and editing only)
- All chapters stored as individual .md files in `chapters/`
```

### `world.md`
```markdown
# World Building

## Setting
Year 2187. Humanity has colonized 12 star systems. Earth is a cultural museum, not a power center.

## Key Rules
- No faster-than-light communication (lightspeed delay is plot-relevant)
- Artificial gravity exists but is expensive — stations use rotation
- AI is ubiquitous but regulated — "sentience licenses" required

## Factions
| Faction | Goal | Territory |
|---------|------|-----------|
| Terran Union | Preserve Earth's cultural authority | Sol system |
| Outer Colonies Alliance | Independence, self-governance | 8 outer systems |
| The Guild | Monopolize AI technology | Everywhere |
```

### `characters.md`
```markdown
# Characters

## Main
| Name | Role | Arc | Voice Note |
|------|------|-----|------------|
| Kira Voss | Protagonist — cargo pilot | Reluctant hero → leader | Short sentences, practical, swears when scared |
| Dr. Arin Zhao | Mentor — exiled AI researcher | Secretive → revealed | Precise, never says more than needed |

## Supporting
[Same format]

## Dead
[Characters killed — include chapter, to avoid accidental resurrection]
```

### `chapters.md`
```markdown
# Chapter Tracker

| Ch | Title | Status | Words | Notes |
|----|-------|--------|-------|-------|
| 1 | "Cold Start" | ✅ Done | 3,200 | Opening hook works |
| 2 | "The Cargo" | ✅ Done | 2,800 | Introduce the mystery |
| 3 | "Station 7" | ✍️ Drafting | 1,400 | Needs action beat in middle |
| 4 | — | ⏳ Planned | — | POV switch to antagonist |
```

### `style-guide.md`
```markdown
# Style Guide

## Voice Rules
- No passive voice in action scenes
- Dialogue tags: "said" 90% of the time. No "exclaimed," "uttered," "opined"
- Chapter endings: always a hook, never a resolution

## Banned Words
- "suddenly" — show the surprise, don't announce it
- "very" / "really" — find a stronger word
- "began to" / "started to" — just do the action

## Formatting
- Chapters: `ch-XX-title.md`
- Scene breaks: `---` on its own line
- Internal monologue: *italics*, no quotes
```

### `lessons.md`
Same format as other projects — but content-specific:

```markdown
### 2026-05 — Beta reader: protagonist's motivation unclear in act 2
**What happened:** 3 out of 5 beta readers said they didn't understand why Kira kept going.
**Root cause:** Motivation was shown in chapter 1, never reinforced. Readers forgot.
**Impact:** Rewrote 4 chapters to add motivation reminders.
**Prevention:** Character motivation checklist: every 5 chapters, verify the reader can answer "why is the protagonist doing this?"
```

---

## Content-Specific Rules

1. **Character voice consistency.** When the agent writes dialogue, it must reference `characters.md` for voice notes.
2. **Kill tracking.** Dead characters listed in `characters.md` to prevent accidental resurrection.
3. **Chapter status is single source of truth.** If `chapters.md` says "Drafting," nothing else matters.
4. **Beta feedback goes in lessons.** Every round of external feedback creates at least one lesson entry.
