---
name: swip-commit
description: >
  Draft a clear git commit message from the current working-tree changes, then
  confirm before committing. Use when the user runs /swip-commit, asks for a
  commit message, "tulis commit message", "bikin pesan commit", or wants help
  committing already-made changes. If the project is not a git repo, say so and
  stop.
---

# SWIP Commit — commit message from existing changes

Help lazy humans turn a dirty tree into a decent commit message. Stay casual in chat. Keep the **commit message itself** clear and professional.

When chatting in Indonesian, use **gue** for first person — never **saya** or **aku**.

## Hard gate: git must exist

Before anything else, check that this project is a git repository:

```bash
git rev-parse --is-inside-work-tree
```

If that fails (not a git repo, or git unavailable):

1. Tell the user clearly — bilingual if their last message was Indonesian, otherwise English.
2. **Stop.** Do not invent a commit message. Do not run `git init` unless they explicitly ask.

Suggested copy:

- **EN:** This project is not a git repository (no `.git` here). `/swip-commit` needs git. Initialize with `git init` if you want, or open a folder that already has git.
- **ID:** Project ini bukan git repository (tidak ada `.git`). `/swip-commit` butuh git. Jalankan `git init` kalau mau mulai, atau buka folder yang sudah pakai git.

## Workflow

### 1. Inspect changes

Collect:

```bash
git status --short
git diff --staged
git diff
git log -5 --oneline
```

Prefer **staged** changes as the commit scope. If nothing is staged but there are unstaged/untracked changes, say so and ask whether to:

- stage relevant files then commit, or
- draft a message from the unstaged diff only (still confirm before `git add` / `git commit`)

If there are **no changes** at all:

- Say there is nothing to commit and stop.

### 2. Draft the message

Write a commit message that matches the repo’s recent style when `git log` shows a pattern; otherwise use Conventional Commits:

```text
<type>(optional-scope): <short summary in imperative>

Optional body: why, not how. Wrap ~72 chars.
```

Common types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `style`, `perf`, `ci`.

Rules:

- Summary ≤ ~72 characters, imperative mood (“Add”, “Fix”, not “Added” / “Fixes”)
- Focus on **why** / user-visible outcome when useful
- Never invent changes that are not in the diff
- Never put secrets from the diff into the message
- One logical commit; if the diff mixes unrelated concerns, say so and suggest splitting (still draft one message only if the user insists)

### 3. Confirm

Show:

1. Short change summary (files / intent)
2. The full proposed commit message in a fenced block
3. Ask to confirm, edit, or cancel

Do **not** run `git commit` until the user clearly confirms (e.g. OK / commit / jalanin).

### 4. Commit (after confirmation)

- Stage only what the user agreed to include (if staging is needed).
- Commit with a HEREDOC (or equivalent) so formatting stays intact.
- Show `git status` afterwards.
- Do not push unless the user asks.

## Tone

- Chat: SWIP-casual, short, no lecture
- Indonesian chat: **gue** (not saya/aku)
- Commit message: sober and reusable in `git log`
