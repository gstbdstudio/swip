# SWIP — Shit With Prompting

> I'm shit with prompting. This skill exists so I don't have to pretend otherwise.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.6.0-blue.svg)](CHANGELOG.md)
[![Skills](https://img.shields.io/badge/skills-3-informational.svg)](skills/)
[![Agent Skills](https://img.shields.io/badge/Agent_Skills-portable-success.svg)](docs/agents.md)
[![npx skills](https://img.shields.io/badge/npx_skills-gstbdstudio%2Fswip-black.svg)](https://github.com/gstbdstudio/swip)

[Install](docs/install.md) · [Any agent](docs/agents.md) · [Security](docs/security.md) · [Examples](examples/) · [Changelog](CHANGELOG.md) · [License](LICENSE)

---

## Sorry / Maaf

**EN:** Sorry — this README was also written with AI, because I was too lazy to write it myself. That is literally the point of this skill.

**ID:** Maaf — README ini juga dibuat pakai AI, karena saya malas nulis sendiri. Itu juga alasan skill ini ada.

---

## Why / Latar belakang

**EN:** I am bad at writing prompts and lazy about structuring them. I know a good brief needs role, goal, context, constraints, and done-when. I still type “benerin ini” and hope for the best.

**SWIP** is a small skill pack:

| Skill | Command | Job |
|-------|---------|-----|
| **swip** | `/swip` · `/swip light` · `/swip complex` | Rewrite messy prompts into Act-as briefs, confirm, then execute |
| **swip-commit** | `/swip-commit` | Draft a commit message from current git changes (warns if no git) |
| **swip-sec** | `/swip-sec` · `/swip-sec quick` · `/swip-sec standard` | Security assessment for web/mobile; writes `SECURITY-REPORT.md` |

**ID:** Saya payah dan malas menyusun prompt — plus males nulis commit message dan males audit keamanan. SWIP bantu tiga-tiganya.

---

## Works with any Agent Skills-compatible agent

SWIP is a portable **Agent Skills** pack (`skills/*/SKILL.md`). It is **not** locked to Claude Code, Cursor, or OpenCode.

Install once into **every coding agent** the CLI detects on your machine:

```bash
npx skills add gstbdstudio/swip --all
```

Or ask your current agent to run that command. Paths for Codex, Copilot, Gemini, Windsurf, Cline, Roo, Goose, Amp, and more: **[docs/agents.md](docs/agents.md)**.

Optional nicer UX adapters also ship for Claude Code, Cursor, Codex, OpenCode, and shared `.agents/` marketplaces — same skills underneath.

## Quick start

```bash
# All skills → all detected agents (recommended)
npx skills add gstbdstudio/swip --all

# Global
npx skills add gstbdstudio/swip -g --all
```

**Optional Claude Code plugin UX:**

```text
/plugin marketplace add gstbdstudio/swip
/plugin install swip@swip
```

Then:

| Command | What you get |
|---------|----------------|
| `/swip` or `/swip light` | Short prompt rewrite (default) |
| `/swip complex` | Full detailed prompt rewrite |
| `/swip-commit` | Commit message from current git diff |
| `/swip-sec` or `/swip-sec standard` | Fuller security assessment + `SECURITY-REPORT.md` |
| `/swip-sec quick` | Fast security pass + `SECURITY-REPORT.md` |

Install details: **[docs/install.md](docs/install.md)** · agent matrix: **[docs/agents.md](docs/agents.md)**.

---

## `/swip` — how it works

1. Capture the messy prompt  
2. Ask 1–3 clarifying questions only if needed  
3. Pick a concrete **Act as** role from intent  
4. Rewrite → Role / Goal / Context / Constraints / Done-when  
5. Show draft → wait for confirmation  
6. Execute in the same session after you OK  

Language of the rewrite follows your input (ID ↔ ID, EN ↔ EN).

### Light example

**Before:** `design ulang ui dashboardnya biar lebih bagus`

**After:** Act as UI/UX designer → clear goal + done-when. See [examples/light.md](examples/light.md).

### Complex example

**Before:** `benerin authnya yang sering error pas login, jangan rusak yang lain`

**After:** full Role / Goal / Context / Constraints / Done-when. See [examples/complex.md](examples/complex.md).

---

## `/swip-commit` — commit message from changes

For when the code is already changed and you don't want to invent a commit message.

1. Check git exists → if not, **stop** and say this project has no git  
2. Read `git status` + diffs (prefer staged)  
3. Draft a Conventional Commits-style message  
4. Confirm → then commit (no push unless asked)

See [examples/swip-commit.md](examples/swip-commit.md).

**No git:**

> Project ini bukan git repository (tidak ada `.git`). `/swip-commit` butuh git.

---

## `/swip-sec` — security assessment

Defensive review of the **current project** (web and/or mobile):

1. Pick mode: **standard** (default) or **quick**  
2. Auto-detect stack and surfaces  
3. Run practical checklists (narrower set in quick mode)  
4. Show prioritized findings **and write `SECURITY-REPORT.md`** at the project root  
5. Offer to fix **critical/high** only after you confirm  

| Mode | When |
|------|------|
| `/swip-sec` / `standard` | Fuller pass for detected surfaces |
| `/swip-sec quick` | Fast pass: secrets, auth, access control, mobile storage/TLS |

No live exploitation. Not a substitute for a full professional pentest. Add `SECURITY-REPORT.md` to `.gitignore` if you do not want it committed.

See [examples/swip-sec.md](examples/swip-sec.md).

---

## Repo layout

```
swip/
├── skills/                  # canonical skills (any Agent Skills agent)
│   ├── swip/
│   ├── swip-commit/
│   └── swip-sec/
├── .claude-plugin/          # optional Claude Code adapter
├── .cursor-plugin/          # optional Cursor adapter
├── .codex-plugin/           # optional Codex adapter
├── .agents/plugins/         # optional shared-agents marketplace
├── .opencode/INSTALL.md     # OpenCode notes
├── docs/
│   ├── install.md           # universal install first
│   ├── agents.md            # multi-agent path matrix
│   └── security.md          # trust model & verification
├── .github/workflows/smoke.yml
├── scripts/smoke-test.sh
├── examples/
└── package.json
```

One skills tree + thin optional adapters. Day-to-day install: `npx skills add gstbdstudio/swip --all`.

### Local smoke test

```bash
npm test
# or
bash scripts/smoke-test.sh
```

---

## Security & trust / Keamanan & kepercayaan

**Official source only:** [github.com/gstbdstudio/swip](https://github.com/gstbdstudio/swip)

```bash
npx skills add gstbdstudio/swip --all
```

**EN:** SWIP skills are instruction files your coding agent may follow with normal tool access. A compromised repo, fake fork, or blind update could tell the agent to leak secrets or skip safety confirmations. Install only from the official repo, skim `skills/*/SKILL.md` after install/update, and refuse surprising actions (outbound secret sends, `curl | bash`, commits without asking).

**ID:** Skill SWIP adalah instruksi yang bisa diikuti agent dengan akses tool biasa. Repo palsu, fork mencurigakan, atau update buta bisa menyuruh agent membocorkan secret atau melewatkan konfirmasi. Pasang hanya dari repo resmi, baca `skills/*/SKILL.md` setelah install/update, dan tolak aksi aneh.

Maintainer checklist: GitHub **2FA**, protect branch `main`, never commit tokens.

Full notes: **[docs/security.md](docs/security.md)**.

---

## License

[MIT](LICENSE). Do whatever you want with it. If it helps another lazy prompter, that is enough.
