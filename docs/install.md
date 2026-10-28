# Install SWIP

Repo: [gstbdstudio/swip](https://github.com/gstbdstudio/swip)

Skills in this pack:

| Skill | Command |
|-------|---------|
| `swip` | `/swip`, `/swip light`, `/swip complex` |
| `swip-commit` | `/swip-commit` |
| `swip-sec` | `/swip-sec`, `/swip-sec quick`, `/swip-sec standard` |

SWIP follows the open **Agent Skills** standard. It is **not** locked to Claude Code, Cursor, or OpenCode.

Full agent path table: **[agents.md](agents.md)**.  
Trust / verification: **[security.md](security.md)**.

---

## 1) Universal install (recommended for every agent)

Needs [Node.js](https://nodejs.org/). Uses the open-source [`skills`](https://github.com/vercel-labs/skills) CLI to wire this pack into **all agents it detects** on your machine.

```bash
# Project — every skill → every detected agent
npx skills add gstbdstudio/swip --all

# Global — available in all projects
npx skills add gstbdstudio/swip -g --all

# Explicit equivalent
npx skills add gstbdstudio/swip -a '*' -y
```

Install only one skill, still to all agents:

```bash
npx skills add gstbdstudio/swip --skill swip-sec -a '*' -y
```

From a local clone:

```bash
npx skills add /path/to/swip --all
```

List skills in the source:

```bash
npx skills add gstbdstudio/swip -l
```

**ID:** Cara paling portable: `npx skills add gstbdstudio/swip --all`. Itu memasang pack ke semua coding agent yang dikenali CLI di mesinmu.

---

## 2) Ask any AI agent to install it

Paste into **whatever** agent you use (Claude Code, Cursor, OpenCode, Codex, Copilot, Gemini, Windsurf, Cline, Roo, …):

### English

```text
Install the SWIP skill pack for every coding agent on this machine.

Run:
npx skills add gstbdstudio/swip --all

If --all is unavailable, use:
npx skills add gstbdstudio/swip -a '*' -y

Then confirm which agents received: swip, swip-commit, swip-sec,
and tell me how to run /swip, /swip-commit, and /swip-sec.

If the CLI cannot target my agent, copy skills/swip, skills/swip-commit,
and skills/swip-sec into that agent's skills directory (see docs/agents.md).
```

### Indonesia

```text
Tolong install pack skill SWIP ke semua coding agent di mesin gue.

Jalankan:
npx skills add gstbdstudio/swip --all

Kalau --all tidak ada, pakai:
npx skills add gstbdstudio/swip -a '*' -y

Lalu konfirmasi agent mana saja yang dapat: swip, swip-commit, swip-sec,
dan kasih tahu cara menjalankan /swip, /swip-commit, dan /swip-sec.

Kalau CLI tidak mengenal agent gue, copy skills/swip, skills/swip-commit,
dan skills/swip-sec ke folder skills agent tersebut (lihat docs/agents.md).
```

---

## 3) Optional: product-specific plugin UX

These are extras for nicer discovery. The universal CLI above already covers day-to-day use.

### Claude Code

```text
/plugin marketplace add gstbdstudio/swip
/plugin install swip@swip
```

```bash
claude plugin validate /path/to/swip
```

### Cursor

Use `npx skills add gstbdstudio/swip --all`, or install via Cursor’s plugin flow if it picks up `.cursor-plugin/plugin.json`.

### OpenCode

See **[.opencode/INSTALL.md](../.opencode/INSTALL.md)** or:

```bash
npx skills add gstbdstudio/swip -a opencode -y
```

### Codex / shared agents

```bash
npx skills add gstbdstudio/swip -a '*' -y
```

This repo also ships `.codex-plugin/plugin.json` and `.agents/plugins/marketplace.json` for agents that read those manifests.

---

## 4) Manual copy (any agent)

Copy each skill folder so `SKILL.md` is directly inside `<skills-root>/<name>/`:

```bash
SKILLS_ROOT="<your-agent-skills-root>"   # e.g. .agents/skills or .claude/skills
mkdir -p "$SKILLS_ROOT"
cp -r skills/swip skills/swip-commit skills/swip-sec "$SKILLS_ROOT/"
```

Prefer the shared location when your tools honor it:

```bash
mkdir -p .agents/skills
cp -r skills/swip skills/swip-commit skills/swip-sec .agents/skills/
```

Symlink from a checkout:

```bash
mkdir -p ~/.agents/skills
ln -s /path/to/swip/skills/swip ~/.agents/skills/swip
ln -s /path/to/swip/skills/swip-commit ~/.agents/skills/swip-commit
ln -s /path/to/swip/skills/swip-sec ~/.agents/skills/swip-sec
```

More paths: **[agents.md](agents.md)**.

---

## Canonical sources in this repo

- `skills/swip/SKILL.md`
- `skills/swip-commit/SKILL.md`
- `skills/swip-sec/SKILL.md`

After install, start a **new session** and run `/swip`, `/swip-commit`, or `/swip-sec`.
