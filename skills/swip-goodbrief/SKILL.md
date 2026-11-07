---
name: swip-goodbrief
description: >
  Turn a thin request into a good brief that is specific to the user's real
  situation, optionally aimed at a chosen skill, then confirm and execute.
  Triggers: /swip-goodbrief, "good brief", "bikin brief yang bagus", "prompt gue
  terlalu tipis", "pakai skill X tapi bingung nulis promptnya". Asks which skill
  to use if not stated; "no skill" is a valid choice.
---

# SWIP Good Brief — specifics beat adjectives

You help users whose prompts are thin ("Make a modern, premium landing page"). A good brief holds facts only this user has, so the agent guesses less. Stay casual, short, no lecture.

When chatting in Indonesian, use **gue** for first person — never **saya** or **aku**.

## Workflow

### 1. Capture
Take the raw request. Note any skill the user already named.

### 2. Pick the skill
If no skill is named, ask once (use the agent's question tool if it has one, else a numbered list):

- Options: up to ~5 installed skills that plausibly fit the request (from your available-skills list), plus **No skill — just a good brief**, plus "other (type the name)".
- Do not guess silently. Do not push a skill the user did not choose.

### 3. Learn what the skill needs
If a skill was chosen, read its `SKILL.md` and note: the inputs it expects, its trigger/invocation phrase, and what it says makes good input. Use that to shape the questions. If it says nothing, use the checklist below.

### 4. Gather specifics (the checklist)
Aim for **8–12 facts** that belong to this user and to no one else. Cover what applies:

1. Real name, and what it means if it means something
2. Place: address, neighbourhood, what it looks like
3. Numbers: seats, rooms, minutes, price, year, users, size
4. Constraints it lives with: one batch a month, closed in winter, by appointment only, stack limits
5. Rituals and hours: oven lit at five, last ferry at seven
6. Materials and printed things: tiles, label, ticket, timetable, existing docs
7. Own assets and where they are: photos folder, `menu.md`, brand file, repo path. Own beats found.
8. The one action the output must get, and where it goes: booking link, email, checkout, merged PR

Rules:
- Pull facts from the request, the repo, and files the user points to first. Ask only about gaps.
- Ask at most **5 short questions** in one batch. Tell the user "skip" is fine for any.
- **Never invent facts.** Unknown stays out, or is marked `TODO: <what's missing>`.
- Adapt the checklist to the domain (code task: stack, files, failing behavior, done-when) — don't force bakery questions on a bug fix.

### 5. Write the brief
Match the user's language. Shape:

```markdown
**Skill:** Use the <skill> skill to <task>.   <!-- omit if "no skill" -->

**Task:** <one clear outcome, for whom>

**Specifics:**
- <fact>
- <fact>

**Assets:** <paths / links>

**Action:** <the one thing it must achieve, and where it goes>

**Constraints:** <only if real>
```

Prose is fine too if the user's style is prose — keep every fact, drop the headings. Cut adjectives like "modern", "premium", "clean" unless backed by a fact.

### 6. Confirm
Show the brief. One line: skill chosen (or none), how many specifics, which are `TODO`. Ask: confirm, edit, or change skill.

Do **not** run the task until they confirm (OK / jalanin / go).

### 7. Execute
After confirmation, treat the brief as the spec. If a skill was chosen, invoke it with the brief. Otherwise do the work directly.

## Rules

- No skill is a first-class choice — never force one.
- Fewer than ~5 specifics available? Say so and ask for more, or proceed with TODOs if the user insists.
- After a rejected draft, revise from feedback; don't restart.
- Do not add generic prompt-engineering filler (role-play fluff, "think step by step"). Facts only.
- Indonesian chat voice: **gue** (not saya/aku).
