# Install SWIP

Repo: [gstbdstudio/swip](https://github.com/gstbdstudio/swip)

Recommended: one CLI command, or paste a short prompt into your agent.

---

## 1) One-liner (`npx skills`)

Works for **Claude Code**, **Cursor**, **OpenCode**, and more. Needs Node.js.

```bash
# Project install (current repo only)
npx skills add gstbdstudio/swip --skill swip -y

# Global install (all projects on this machine)
npx skills add gstbdstudio/swip --skill swip -g -y

# Only specific agents
npx skills add gstbdstudio/swip --skill swip -a claude-code -a cursor -a opencode -y

# All detected agents
npx skills add gstbdstudio/swip --skill swip -a '*' -y
```

From a local clone:

```bash
npx skills add /path/to/swip --skill swip -y
npx skills add /path/to/swip --skill swip -g -a claude-code -a cursor -a opencode -y
```

List skills in the source before installing:

```bash
npx skills add gstbdstudio/swip -l
```

**ID:** `npx skills add gstbdstudio/swip --skill swip -y`. Tambah `-g` untuk global, atau `-a claude-code -a cursor -a opencode` untuk agent tertentu.

---

## 2) Ask your AI agent

### English (any agent)

```text
Install the SWIP skill for me.

Preferred method:
1. Run: npx skills add gstbdstudio/swip --skill swip -y
2. Target agents: claude-code, cursor, and opencode.
   Use -g if I ask for a global install.
3. Confirm the skill is visible, then tell me how to run /swip.

If npx skills is unavailable, copy this repo so SKILL.md lands at the correct skills path for this agent (see docs/install.md) and verify.
```

### Indonesia (agent apa saja)

```text
Tolong install skill SWIP untuk saya.

Cara yang diutamakan:
1. Jalankan: npx skills add gstbdstudio/swip --skill swip -y
2. Pasang ke agent: claude-code, cursor, dan opencode.
   Pakai -g kalau saya minta install global.
3. Pastikan skill kelihatan, lalu kasih tahu cara pakai /swip.

Kalau npx skills tidak ada, copy file skill ini ke path skills yang benar untuk agent ini (lihat docs/install.md), lalu verifikasi.
```

### Per-agent shortcuts

**Claude Code**

```text
Install skill SWIP with:
npx skills add gstbdstudio/swip --skill swip -a claude-code -y
Then confirm it shows up as /swip (project: .claude/skills/swip, global: ~/.claude/skills/swip).
```

**Cursor**

```text
Install skill SWIP with:
npx skills add gstbdstudio/swip --skill swip -a cursor -y
Then confirm it lands in .cursor/skills/swip (project) or ~/.cursor/skills/swip (global with -g).
```

**OpenCode**

```text
Install skill SWIP with:
npx skills add gstbdstudio/swip --skill swip -a opencode -y
Then confirm OpenCode can see it (project .opencode/skills or .opencode/skill, or global ~/.config/opencode/skills).
```

---

## 3) Where each agent looks

| Agent | Project | Global |
|-------|---------|--------|
| **Claude Code** | `.claude/skills/swip/SKILL.md` | `~/.claude/skills/swip/SKILL.md` |
| **Cursor** | `.cursor/skills/swip/SKILL.md` | `~/.cursor/skills/swip/SKILL.md` |
| **OpenCode** | `.opencode/skills/swip/SKILL.md` (also `.claude/skills/`, `.agents/skills/`) | `~/.config/opencode/skills/swip/SKILL.md` (also `~/.claude/skills/`, `~/.agents/skills/`) |

After install, start a **new session** and run `/swip`.

---

## 4) Manual copy (fallback)

Copy the repo folder so `SKILL.md` sits directly inside the skill directory (do not nest one level too deep):

```bash
# Claude Code (project)
mkdir -p .claude/skills && cp -r <path-to-swip> .claude/skills/swip

# Cursor (project)
mkdir -p .cursor/skills && cp -r <path-to-swip> .cursor/skills/swip

# OpenCode (project)
mkdir -p .opencode/skills && cp -r <path-to-swip> .opencode/skills/swip
```

Global: `~/.claude/skills/`, `~/.cursor/skills/`, `~/.config/opencode/skills/`.

Symlink instead of copy:

```bash
ln -s <path-to-swip> ~/.claude/skills/swip
ln -s <path-to-swip> ~/.cursor/skills/swip
ln -s <path-to-swip> ~/.config/opencode/skills/swip
```
