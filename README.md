# SWIP — Shit With Prompting

> I'm shit with prompting. This skill exists so I don't have to pretend otherwise.

[Install](docs/install.md) · [Examples](examples/) · [Changelog](CHANGELOG.md) · [License](LICENSE)

---

## Sorry / Maaf

**EN:** Sorry — this README was also written with AI, because I was too lazy to write it myself. That is literally the point of this skill.

**ID:** Maaf — README ini juga dibuat pakai AI, karena saya malas nulis sendiri. Itu juga alasan skill ini ada.

---

## Why / Latar belakang

**EN:** I am bad at writing prompts and lazy about structuring them. I know a good brief needs role, goal, context, constraints, and done-when. I still type “benerin ini” and hope for the best.

**SWIP** takes that mess, picks a fitting **Act as** role, rewrites a clean brief, waits for confirmation, then runs the work in the same session.

**ID:** Saya payah dan malas menyusun prompt. SWIP merapikan permintaan berantakan jadi brief ber-role, minta konfirmasi, lalu mengerjakan di sesi yang sama.

---

## Quick start

**Universal (any agent):**

```bash
npx skills add gstbdstudio/swip --skill swip -y
```

**Claude Code (plugin):**

```text
/plugin marketplace add gstbdstudio/swip
/plugin install swip@swip
```

**OpenCode:** follow [.opencode/INSTALL.md](.opencode/INSTALL.md) or paste that URL into the agent.

Then:

| Command | What you get |
|---------|----------------|
| `/swip` or `/swip light` | Short rewrite (default) |
| `/swip complex` | Full detailed rewrite |

Or say: “rewrite my prompt” / “rapihkan promptku” / “I’m shit with prompting”.

Full paths for Claude Code, Cursor, OpenCode, agent prompts, manual copy: **[docs/install.md](docs/install.md)**.

---

## How it works / Cara kerja

1. Capture the messy prompt  
2. Ask 1–3 clarifying questions only if needed  
3. Pick a concrete **Act as** role from intent  
4. Rewrite → Role / Goal / Context / Constraints / Done-when  
5. Show draft → wait for confirmation  
6. Execute in the same session after you OK  

Language of the rewrite follows your input (ID ↔ ID, EN ↔ EN).

---

## Examples / Contoh

### Light — before

```text
design ulang ui dashboardnya biar lebih bagus
```

### Light — after

```markdown
**Role:** Act as a UI/UX designer for web dashboards.

**Goal:** Redesign the dashboard UI so it looks clearer and more polished.

**Context:** Existing web app dashboard; improve visual hierarchy and usability without a full product rethink.

**Done when:**
- Layout and key screens feel cleaner and easier to scan
- Changes stay within the current product scope
```

### Complex — before

```text
benerin authnya yang sering error pas login, jangan rusak yang lain
```

### Complex — after

```markdown
**Role:** Act as a senior backend engineer focused on authentication and session security.

**Goal:** Fix intermittent login failures so users can sign in reliably, without regressing other auth flows.

**Context:**
- Login sometimes fails (timing / race / token refresh unclear)
- Related surfaces: signup, logout, password reset, session refresh

**Constraints:**
- Do not rewrite the whole auth system
- Prefer root-cause fix over symptom patching
- Add or update tests for the failure path

**Done when:**
- Failure is fixed with a clear root cause
- Login succeeds consistently in the failing scenario
- Adjacent auth flows still work
```

More: [examples/light.md](examples/light.md) · [examples/complex.md](examples/complex.md)

---

## Repo layout

```
swip/
├── skills/swip/SKILL.md     # canonical skill (agents load this)
├── .claude-plugin/          # Claude Code plugin + marketplace
├── .cursor-plugin/          # Cursor plugin manifest
├── .opencode/INSTALL.md     # OpenCode install notes
├── docs/install.md
├── examples/
├── package.json
├── README.md
├── LICENSE
└── CHANGELOG.md
```

Same idea as larger skill frameworks: **one skills tree**, thin per-agent adapters.

---

## License

[MIT](LICENSE). Do whatever you want with it. If it helps another lazy prompter, that is enough.
