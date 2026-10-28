# Agent compatibility

SWIP uses the open **Agent Skills** format (`skills/<name>/SKILL.md`). Any coding agent that loads that format can use this pack.

You do **not** need Claude Code, Cursor, or OpenCode specifically. Those three ship thin plugin adapters in this repo for nicer install UX; everything else should use the universal CLI (or a manual copy into that agent’s skills folder).

## Recommended: install to every detected agent

```bash
# Project — all skills, all agents the CLI finds on this machine
npx skills add gstbdstudio/swip --all

# Same idea, explicit flags
npx skills add gstbdstudio/swip -a '*' -y

# Global (every project on this machine)
npx skills add gstbdstudio/swip -g --all
```

`--all` is shorthand for installing every skill to every agent the [`skills`](https://github.com/vercel-labs/skills) CLI supports on your system.

List what the CLI can target on your machine:

```bash
npx skills list --json
```

## Common skills directories

Exact folders vary by agent version. The CLI places files correctly when you pass `-a` / `--all`. For manual installs, copy each of `skills/swip`, `skills/swip-commit`, and `skills/swip-sec` into the agent’s skills root so that `SKILL.md` sits at:

`<skills-root>/<skill-name>/SKILL.md`

| Agent | Typical project path | Typical global path |
|-------|----------------------|---------------------|
| **Any / shared** | `.agents/skills/` | `~/.agents/skills/` |
| Claude Code | `.claude/skills/` | `~/.claude/skills/` |
| Cursor | `.cursor/skills/` | `~/.cursor/skills/` |
| OpenCode | `.opencode/skills/` (also reads `.claude/skills/`, `.agents/skills/`) | `~/.config/opencode/skills/` |
| Codex | `.codex/skills/` or `.agents/skills/` | `~/.codex/skills/` / `~/.agents/skills/` |
| GitHub Copilot | `.github/skills/` | `~/.copilot/skills/` / `~/.agents/skills/` |
| Gemini CLI | `.gemini/skills/` | `~/.gemini/skills/` |
| Windsurf | `.windsurf/skills/` | check product docs / `npx skills` |
| Cline | `.cline/skills/` | check product docs / `npx skills` |
| Roo Code | `.roo/skills/` | `~/.roo/skills/` |
| Kilo Code | `.kilocode/skills/` | `~/.kilocode/skills/` |
| Goose | `.goose/skills/` | `~/.config/goose/skills/` |
| Amp | `.agents/skills/` | `~/.config/agents/skills/` |
| Antigravity | `.agent/skills/` | product-specific |

If your agent is missing from this table, still try:

```bash
npx skills add gstbdstudio/swip -a '*' -y
```

or ask the agent:

```text
Install the SWIP skill pack for every coding agent on this machine:
npx skills add gstbdstudio/swip --all
Then list which agents received swip, swip-commit, and swip-sec.
```

## Optional first-class adapters in this repo

These help specific products discover SWIP as a plugin/marketplace. They are **additive** — the skills themselves stay under `skills/`.

| Path | Product |
|------|---------|
| `.claude-plugin/` | Claude Code |
| `.cursor-plugin/` | Cursor |
| `.codex-plugin/` | Codex |
| `.agents/plugins/` | Shared agents marketplace shape |
| `.opencode/INSTALL.md` | OpenCode install notes |

## After install

Start a **new session** in your agent, then run `/swip`, `/swip-commit`, or `/swip-sec` (or ask in natural language: “rapihkan prompt”, “bikin commit message”, “cek keamanan”).
