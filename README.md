# SWIP — Shit With Prompting

> I'm shit with prompting. This skill exists so I don't have to pretend otherwise.

[![Smoke](https://github.com/gstbdstudio/swip/actions/workflows/smoke.yml/badge.svg)](https://github.com/gstbdstudio/swip/actions/workflows/smoke.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.4.0-blue.svg)](CHANGELOG.md)
[![Skills](https://img.shields.io/badge/skills-3-informational.svg)](skills/)
[![npx skills](https://img.shields.io/badge/npx_skills-gstbdstudio%2Fswip-black.svg)](https://github.com/gstbdstudio/swip)

[Install](docs/install.md) · [Examples](examples/) · [Changelog](CHANGELOG.md) · [License](LICENSE)

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
| **swip-sec** | `/swip-sec` | Security assessment for web and/or mobile apps (checklist + prioritized fixes) |

**ID:** Saya payah dan malas menyusun prompt — plus males nulis commit message dan males audit keamanan. SWIP bantu tiga-tiganya.

---

## Quick start

**Universal (any agent):**

```bash
npx skills add gstbdstudio/swip -y
```

**Claude Code (plugin):**

```text
/plugin marketplace add gstbdstudio/swip
/plugin install swip@swip
```

**OpenCode:** [.opencode/INSTALL.md](.opencode/INSTALL.md)

Then:

| Command | What you get |
|---------|----------------|
| `/swip` or `/swip light` | Short prompt rewrite (default) |
| `/swip complex` | Full detailed prompt rewrite |
| `/swip-commit` | Commit message from current git diff |
| `/swip-sec` | Security assessment (web + mobile auto-detect) |

Full install paths: **[docs/install.md](docs/install.md)**.

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

1. Auto-detect stack and surfaces  
2. Run practical checklists (auth, access control, secrets, mobile storage/TLS, …)  
3. Report prioritized findings with evidence + remediation  
4. Offer to fix **critical/high** only after you confirm  

No live exploitation. Not a substitute for a full professional pentest.

See [examples/swip-sec.md](examples/swip-sec.md).

---

## Repo layout

```
swip/
├── skills/
│   ├── swip/SKILL.md
│   ├── swip-commit/SKILL.md
│   └── swip-sec/
│       ├── SKILL.md
│       └── references/checklists.md
├── .claude-plugin/          # Claude Code plugin + marketplace + icon
├── .cursor-plugin/          # Cursor plugin manifest
├── .opencode/INSTALL.md
├── .github/workflows/smoke.yml
├── scripts/smoke-test.sh
├── docs/install.md
├── examples/
├── package.json
├── README.md
├── LICENSE
└── CHANGELOG.md
```

One skills tree, thin per-agent adapters, small CI smoke suite.

### Local smoke test

```bash
npm test
# or
bash scripts/smoke-test.sh
```

---

## License

[MIT](LICENSE). Do whatever you want with it. If it helps another lazy prompter, that is enough.
