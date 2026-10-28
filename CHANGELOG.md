# Changelog

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
