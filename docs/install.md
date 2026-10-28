# Install SWIP

Repo: [gstbdstudio/swip](https://github.com/gstbdstudio/swip)

Skills in this pack:

| Skill | Command |
|-------|---------|
| `swip` | `/swip`, `/swip light`, `/swip complex` |
| `swip-commit` | `/swip-commit` |
| `swip-sec` | `/swip-sec`, `/swip-sec quick`, `/swip-sec standard` |

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
# Project install (both skills)
npx skills add gstbdstudio/swip -y

# Or pick one
npx skills add gstbdstudio/swip --skill swip -y
npx skills add gstbdstudio/swip --skill swip-commit -y
npx skills add gstbdstudio/swip --skill swip-sec -y

# Global install
npx skills add gstbdstudio/swip -g -y

# Specific agents
npx skills add gstbdstudio/swip -a claude-code -a cursor -a opencode -y

# All detected agents
npx skills add gstbdstudio/swip -a '*' -y
```

From a local clone:

```bash
npx skills add /path/to/swip -y
```

List skills in the source:

```bash
npx skills add gstbdstudio/swip -l
```

**ID:** `npx skills add gstbdstudio/swip -y` memasang seluruh pack. Tambah `-g` untuk global.

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

Canonical sources in this repo:

- `skills/swip/SKILL.md`
- `skills/swip-commit/SKILL.md`
- `skills/swip-sec/SKILL.md`

After install, start a **new session** and run `/swip`, `/swip-commit`, or `/swip-sec`.

---

## Manual copy (fallback)

```bash
# Claude Code (project) — copy whole skills tree
mkdir -p .claude/skills
cp -r <repo>/skills/swip <repo>/skills/swip-commit <repo>/skills/swip-sec .claude/skills/

# Cursor (project)
mkdir -p .cursor/skills
cp -r <repo>/skills/swip <repo>/skills/swip-commit <repo>/skills/swip-sec .cursor/skills/

# OpenCode (project)
mkdir -p .opencode/skills
cp -r <repo>/skills/swip <repo>/skills/swip-commit <repo>/skills/swip-sec .opencode/skills/
```

Symlink:

```bash
ln -s <repo>/skills/swip ~/.claude/skills/swip
ln -s <repo>/skills/swip-commit ~/.claude/skills/swip-commit
ln -s <repo>/skills/swip-sec ~/.claude/skills/swip-sec
ln -s <repo>/skills/swip ~/.cursor/skills/swip
ln -s <repo>/skills/swip-commit ~/.cursor/skills/swip-commit
ln -s <repo>/skills/swip-sec ~/.cursor/skills/swip-sec
ln -s <repo>/skills/swip ~/.config/opencode/skills/swip
ln -s <repo>/skills/swip-commit ~/.config/opencode/skills/swip-commit
ln -s <repo>/skills/swip-sec ~/.config/opencode/skills/swip-sec
```
