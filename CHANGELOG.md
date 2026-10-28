# Changelog

## 0.6.0 — 2026-03-26

- Position SWIP as **portable Agent Skills** for any compatible coding agent (not only Claude/Cursor/OpenCode)
- Recommend `npx skills add gstbdstudio/swip --all` (`-a '*'`) as the primary install
- Add `docs/agents.md` with multi-agent skills path matrix
- Add thin `.codex-plugin/` and `.agents/plugins/` adapters
- Rewrite `docs/install.md` with universal-first flow + any-agent install prompts
- Add **Security & trust** docs (`docs/security.md` + README section)
- Indonesian voice: use **gue** (not saya/aku) in docs + skill chat tone

## 0.5.0 — 2026-03-26

- `/swip-sec` modes: **quick** (fast pass) and **standard** (default, fuller checklist)
- Always write assessment output to project-root **`SECURITY-REPORT.md`**
- Quick-focus subset documented in `skills/swip-sec/references/checklists.md`

## 0.4.0 — 2026-03-26

- Add **`swip-sec`** skill (`/swip-sec`): security assessment for web and/or mobile apps
- Auto-detect stack, checklist review, prioritized findings + remediation
- Offer high/critical fixes only after confirmation (no live exploitation)
- Add `skills/swip-sec/references/checklists.md` and example

## 0.3.0 — 2026-03-26

- Add **`swip-commit`** skill (`/swip-commit`): draft commit messages from current diffs
- Hard gate when the project is not a git repository (clear EN/ID notice, then stop)
- Add `scripts/smoke-test.sh` (frontmatter + manifest checks; optional `claude plugin validate`)
- Add GitHub Actions smoke workflow + README badges
- Bump pack to two skills under `skills/`

## 0.2.0 — 2026-03-26

- Move canonical skill to `skills/swip/SKILL.md` (plugin-friendly layout)
- Add Claude Code adapters: `.claude-plugin/plugin.json` + `marketplace.json`
- Add Cursor adapter: `.cursor-plugin/plugin.json`
- Add OpenCode install notes: `.opencode/INSTALL.md`
- Add `package.json` (version + metadata)
- Document plugin install paths alongside `npx skills`

## 0.1.0 — 2026-03-26

- Initial public release of **SWIP** (Shit With Prompting)
- Modes: `light` (default) and `complex`
- Workflow: clarify → pick Act-as role → rewrite → confirm → execute
- Install via `npx skills add gstbdstudio/swip --skill swip`
- Docs split: README (story + usage) and `docs/install.md`
- Examples: light and complex before/after prompts
