# Install SWIP

Repo: [gstbdstudio/swip](https://github.com/gstbdstudio/swip)

Three good paths: **plugin install** (Claude / Cursor), **`npx skills`** (any agent), or **ask your agent**.

---

## Claude Code (plugin)

Add this repo as a marketplace, then install the plugin:

```text
/plugin marketplace add gstbdstudio/swip
/plugin install swip@swip
```

Or from a local checkout:

```bash
claude plugin marketplace add /path/to/swip
# then in Claude Code:
# /plugin install swip@swip
```

Validate a local checkout:

```bash
claude plugin validate /path/to/swip
```

After install, start a new session and run `/swip` (or `/swip:swip` depending on namespacing).

---

## Cursor (plugin)

If your Cursor build supports plugin install from a repo/marketplace entry that ships `.cursor-plugin/plugin.json`:

- Add / install the **swip** plugin from [gstbdstudio/swip](https://github.com/gstbdstudio/swip), **or**
- Fall back to `npx skills` below (always works)

Cursor looks for skills under `.cursor/skills/` after a skills-CLI install, and under `./skills/` when loading this repo as a plugin (`"skills": "./skills/"` in `.cursor-plugin/plugin.json`).

---

## OpenCode

See **[.opencode/INSTALL.md](../.opencode/INSTALL.md)** — short version:

```bash
npx skills add gstbdstudio/swip --skill swip -a opencode -y
```

Or paste into OpenCode:

```text
Fetch and follow instructions from https://raw.githubusercontent.com/gstbdstudio/swip/refs/heads/main/.opencode/INSTALL.md
```

---

## Any agent — `npx skills` (recommended universal path)

Needs Node.js. Works for Claude Code, Cursor, OpenCode, and more.

```bash
# Project install
npx skills add gstbdstudio/swip --skill swip -y

# Global install
npx skills add gstbdstudio/swip --skill swip -g -y

# Specific agents
npx skills add gstbdstudio/swip --skill swip -a claude-code -a cursor -a opencode -y

# All detected agents
npx skills add gstbdstudio/swip --skill swip -a '*' -y
```

From a local clone:

```bash
npx skills add /path/to/swip --skill swip -y
```

List skills in the source:

```bash
npx skills add gstbdstudio/swip -l
```

**ID:** `npx skills add gstbdstudio/swip --skill swip -y`. Tambah `-g` untuk global.

---

## Ask your AI agent

### English (any agent)

```text
Install the SWIP skill for me.

Preferred methods (try in order):
1. Claude Code: /plugin marketplace add gstbdstudio/swip then /plugin install swip@swip
2. Any agent: npx skills add gstbdstudio/swip --skill swip -y
   Target claude-code, cursor, and opencode. Use -g for global.
3. Confirm the skill is visible, then tell me how to run /swip.

If those fail, copy skills/swip/ so SKILL.md lands at the correct skills path for this agent.
```

### Indonesia

```text
Tolong install skill SWIP untuk saya.

Urutan yang diutamakan:
1. Claude Code: /plugin marketplace add gstbdstudio/swip lalu /plugin install swip@swip
2. Agent apa saja: npx skills add gstbdstudio/swip --skill swip -y
   Pasang ke claude-code, cursor, dan opencode. Pakai -g kalau global.
3. Pastikan skill kelihatan, lalu kasih tahu cara pakai /swip.

Kalau gagal, copy skills/swip/ ke path skills yang benar untuk agent ini.
```

### Shortcuts

**Claude Code**

```text
Install SWIP as a Claude plugin:
/plugin marketplace add gstbdstudio/swip
/plugin install swip@swip
Confirm /swip works in a new session.
```

**Cursor**

```text
Install skill SWIP with:
npx skills add gstbdstudio/swip --skill swip -a cursor -y
Confirm it lands in .cursor/skills/swip (or ~/.cursor/skills/swip with -g).
```

**OpenCode**

```text
Follow https://raw.githubusercontent.com/gstbdstudio/swip/refs/heads/main/.opencode/INSTALL.md
and install SWIP for OpenCode. Then tell me how to run /swip.
```

---

## Where each agent looks

| Agent | Project | Global |
|-------|---------|--------|
| **Claude Code** | `.claude/skills/swip/SKILL.md` (skills CLI) or plugin via marketplace | `~/.claude/skills/swip/SKILL.md` |
| **Cursor** | `.cursor/skills/swip/SKILL.md` | `~/.cursor/skills/swip/SKILL.md` |
| **OpenCode** | `.opencode/skills/swip/SKILL.md` (also `.claude/skills/`, `.agents/skills/`) | `~/.config/opencode/skills/swip/SKILL.md` |

Canonical source in this repo: `skills/swip/SKILL.md`.

After install, start a **new session** and run `/swip`.

---

## Manual copy (fallback)

```bash
# Claude Code (project)
mkdir -p .claude/skills && cp -r <repo>/skills/swip .claude/skills/swip

# Cursor (project)
mkdir -p .cursor/skills && cp -r <repo>/skills/swip .cursor/skills/swip

# OpenCode (project)
mkdir -p .opencode/skills && cp -r <repo>/skills/swip .opencode/skills/swip
```

Symlink:

```bash
ln -s <repo>/skills/swip ~/.claude/skills/swip
ln -s <repo>/skills/swip ~/.cursor/skills/swip
ln -s <repo>/skills/swip ~/.config/opencode/skills/swip
```
