# SWIP — Shit With Prompting

> I'm shit with prompting. This skill exists so I don't have to pretend otherwise.

---

## Sorry / Maaf

**EN:** Sorry — this README was also written with AI, because I was too lazy to write it myself. That is literally the point of this skill.

**ID:** Maaf — README ini juga dibuat pakai AI, karena saya malas nulis sendiri. Itu juga alasan skill ini ada.

---

## Why this exists / Latar belakang

### English

I am bad at writing prompts and lazy about structuring them. I know a good brief should have a clear role, goal, context, constraints, and done-when criteria. I still type things like “benerin ini” or “design ulang UI-nya” and hope for the best.

**SWIP** (Shit With Prompting) is a portable agent skill that takes my messy request, picks a fitting **Act as** role, rewrites it into a clean brief, shows it for confirmation, then runs the work. Less typing. Less shame. Same agents I already use.

### Indonesia

Saya payah dan malas menyusun prompt. Saya tahu brief yang bagus harus punya role, goal, context, constraints, dan kriteria selesai. Tetap saja saya ngetik “benerin ini” atau “design ulang UI-nya” lalu berharap hasilnya ajaib.

**SWIP** (Shit With Prompting) adalah skill portabel untuk coding agent: ambil permintaan berantakan saya, pilih role **Act as** yang cocok, rapikan jadi brief terstruktur, tampilkan untuk konfirmasi, lalu kerjakan. Lebih sedikit ngetik. Lebih sedikit malu. Agent yang sama.

---

## What it does / Apa yang dilakukan

| Step | English | Indonesia |
|------|---------|-----------|
| 1 | Capture your messy prompt | Ambil prompt berantakanmu |
| 2 | Ask 1–3 clarifying questions if needed | Tanya 1–3 klarifikasi bila perlu |
| 3 | Pick a concrete **Act as** role from intent | Pilih role **Act as** dari intensi |
| 4 | Rewrite into Role / Goal / Context / Constraints / Done-when | Rewrite ke kerangka itu |
| 5 | Show the draft and wait for confirmation | Tampilkan draft, tunggu konfirmasi |
| 6 | Execute in the same session after you OK | Setelah OK, kerjakan di sesi yang sama |

### Modes

| Mode | Command | Style |
|------|---------|--------|
| **light** (default) | `/swip` or `/swip light` | Short rewrite — Role + Goal; other sections only if needed |
| **complex** | `/swip complex` | Full rewrite — every section filled in detail |

Language of the rewrite follows your input (Indonesian in → Indonesian out, English in → English out).

---

## Usage / Cara pakai

### English

1. Install the skill (see below).
2. In your agent, run:
   - `/swip` — short rewrite (default)
   - `/swip light` — same as default
   - `/swip complex` — full detailed rewrite
3. Paste or describe what you want in plain, lazy language.
4. Answer clarifying questions if asked.
5. Review the rewritten brief. Edit or switch mode if you want.
6. Confirm (`OK`, `jalanin`, etc.). The same agent then does the work.

You can also say things like “rewrite my prompt” or “I’m shit with prompting” — the skill description is meant to match that intent.

### Indonesia

1. Install skill-nya (lihat di bawah).
2. Di agent-mu, jalankan:
   - `/swip` — rewrite singkat (default)
   - `/swip light` — sama seperti default
   - `/swip complex` — rewrite lengkap & detail
3. Tempel atau tulis maumu dengan bahasa kasual/malas.
4. Jawab pertanyaan klarifikasi kalau diminta.
5. Cek brief hasil rewrite. Edit atau ganti mode kalau perlu.
6. Konfirmasi (`OK`, `jalanin`, dll.). Agent yang sama lalu mengerjakan tugasnya.

Kamu juga bisa bilang “rapikan promptku” atau “saya payah nulis prompt” — deskripsi skill dibuat supaya nangkep intensi itu.

---

## Install

Repo: [gstbdstudio/swip](https://github.com/gstbdstudio/swip)

Recommended: one CLI command, or paste a short prompt into your agent and let it install for you.

---

### 1) One-liner (`npx skills`) — recommended

Works for **Claude Code**, **Cursor**, and **OpenCode** (and more). Needs Node.js.

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

**From a local clone of this repo:**

```bash
npx skills add /path/to/swip --skill swip -y
npx skills add /path/to/swip --skill swip -g -a claude-code -a cursor -a opencode -y
```

List skills in the source before installing:

```bash
npx skills add gstbdstudio/swip -l
```

**ID:** Seperti skill lain: `npx skills add gstbdstudio/swip --skill swip -y`. Tambah `-g` untuk global, atau `-a claude-code -a cursor -a opencode` untuk agent tertentu.

---

### 2) Ask your AI agent to install it

Paste one of these into Claude Code, Cursor, or OpenCode. Lazy-approved.

#### English prompt (any agent)

```text
Install the SWIP skill for me.

Preferred method:
1. Run: npx skills add gstbdstudio/swip --skill swip -y
2. Target agents: claude-code, cursor, and opencode.
   Use -g if I ask for a global install.
3. Confirm the skill is visible (skills list / skills folder), then tell me how to run /swip.

If npx skills is unavailable, copy this repo’s files so SKILL.md lands at the correct skills path for this agent (see README) and verify.
```

#### Prompt Indonesia (agent apa saja)

```text
Tolong install skill SWIP untuk saya.

Cara yang diutamakan:
1. Jalankan: npx skills add gstbdstudio/swip --skill swip -y
2. Pasang ke agent: claude-code, cursor, dan opencode.
   Pakai -g kalau saya minta install global.
3. Pastikan skill kelihatan, lalu kasih tahu cara pakai /swip.

Kalau npx skills tidak ada, copy file skill ini ke path skills yang benar untuk agent ini (lihat README), lalu verifikasi.
```

#### Per-agent shortcuts

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

### 3) Where each agent looks

| Agent | Project | Global |
|-------|---------|--------|
| **Claude Code** | `.claude/skills/swip/SKILL.md` | `~/.claude/skills/swip/SKILL.md` |
| **Cursor** | `.cursor/skills/swip/SKILL.md` | `~/.cursor/skills/swip/SKILL.md` |
| **OpenCode** | `.opencode/skills/swip/SKILL.md` (also discovers `.claude/skills/` and `.agents/skills/`) | `~/.config/opencode/skills/swip/SKILL.md` (also `~/.claude/skills/`, `~/.agents/skills/`) |

After install, start a **new session** and run `/swip`.

**ID:** Claude Code → `.claude/skills/` · Cursor → `.cursor/skills/` · OpenCode → `.opencode/skills/` (plus path kompatibel). Sesi baru, lalu `/swip`.

---

### 4) Manual copy (fallback)

Only if you refuse CLI and refuse asking an agent. Copy the whole `swip/` folder (must contain `SKILL.md` directly inside — do not nest one level too deep):

```bash
# Claude Code (project)
mkdir -p .claude/skills && cp -r <path-to-swip> .claude/skills/swip

# Cursor (project)
mkdir -p .cursor/skills && cp -r <path-to-swip> .cursor/skills/swip

# OpenCode (project)
mkdir -p .opencode/skills && cp -r <path-to-swip> .opencode/skills/swip
```

Global variants: `~/.claude/skills/`, `~/.cursor/skills/`, `~/.config/opencode/skills/`.

Symlink instead of copy if you keep one canonical folder:

```bash
ln -s <path-to-swip> ~/.claude/skills/swip
ln -s <path-to-swip> ~/.cursor/skills/swip
ln -s <path-to-swip> ~/.config/opencode/skills/swip
```

---

## Files

```
swip/
├── SKILL.md    # agent instructions (the actual skill)
└── README.md   # this file (also AI-written, sorry again)
```

---

## License vibe

Do whatever you want with it. If it helps another lazy prompter, that is enough.
```
