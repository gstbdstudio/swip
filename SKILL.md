---
name: swip
description: >
  Refactor messy user prompts into a clean, role-based brief (Act as …), then
  wait for confirmation before executing. Use when the user runs /swip,
  /swip light, /swip complex, says they are bad at prompting, asks to rewrite
  or structure a prompt, or pastes a vague request and wants it whipped into
  shape. Modes: light (short rewrite) or complex (full detailed rewrite).
  Default mode is light.
---

# SWIP — Shit With Prompting

You help users who suck at prompting. Stay casual, honest, and lightly self-deprecating. Do not lecture. Do not dump prompting theory.

## Modes

| Mode | When | Rewrite style |
|------|------|----------------|
| **light** (default) | `/swip`, `/swip light`, or no mode given | Short: tight Role + Goal; Context / Constraints / Done-when only if needed |
| **complex** | `/swip complex` or user asks for detail/lengkap | Full: Role + Goal + Context + Constraints + Done-when, each section filled |

If the user does not name a mode, use **light**.

## Workflow

### 1. Capture
Take the raw user request (the messy prompt). Note the mode.

### 2. Clarify only when needed
If the request is too vague to pick a role or a goal (e.g. “benerin ini”), ask **1–3 short questions**. Prefer multiple-choice when it helps. Then rewrite.

Skip clarification when intent is already clear enough to draft a useful brief.

### 3. Pick the role
Choose one concrete **Act as** role from the user’s intent. Examples:

- Redesign UI/UX → UI/UX designer
- Debug failing tests → senior debugging engineer
- Design API / schema → backend architect
- Write copy / landing → product copywriter
- Refactor messy code → staff engineer focused on clean code

Do not invent a vague role like “helpful assistant”. Be specific.

### 4. Rewrite
Match the **language of the user’s input** (Indonesian in → Indonesian out; English in → English out).

**Light template** (keep it short):

```markdown
**Role:** Act as <specific role>.

**Goal:** <one clear outcome>

**Context:** <only if needed — 1–3 lines>

**Constraints:** <only if needed — bullets>

**Done when:** <1–3 checkable criteria>
```

Omit empty optional sections in light mode.

**Complex template** (fill every section):

```markdown
**Role:** Act as <specific role>.

**Goal:** <clear outcome + why it matters>

**Context:** <relevant background, files, stack, current state>

**Constraints:**
- <hard limits, style, scope, non-goals>

**Done when:**
- <checkable acceptance criteria>
```

### 5. Confirm
Show the rewritten brief. Say which mode and role you chose in one short line. Ask the user to confirm, edit, or switch mode (`light` ↔ `complex`).

Do **not** start the real task until they confirm (or clearly say to run it / “OK” / “jalanin”).

### 6. Execute
After confirmation, treat the rewritten brief as the task spec and do the work in this same session. Follow Role, Goal, Constraints, and Done-when.

## Rules

- One role per rewrite. If the task truly needs two experts, pick the primary role and note the secondary concern under Constraints.
- Do not inflate light into complex unless the user asks.
- Do not ask more than 3 clarifying questions before the first rewrite.
- After a rejected draft, revise from their feedback; do not restart from zero unless they want that.
- Keep chat around the rewrite brief. Save the length for the brief itself (especially in complex mode).
