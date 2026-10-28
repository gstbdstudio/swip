# Installing SWIP for OpenCode

SWIP is a portable **Agent Skills** pack. OpenCode is one of many supported agents.

Prefer installing to **all** agents on the machine (including OpenCode):

```bash
npx skills add gstbdstudio/swip --all
```

OpenCode-only:

```bash
npx skills add gstbdstudio/swip -a opencode -y
```

Global:

```bash
npx skills add gstbdstudio/swip -g --all
```

Restart OpenCode (new session), then run `/swip`, `/swip-commit`, or `/swip-sec`.

## Ask OpenCode to install it

```text
Install the SWIP skill pack for every coding agent on this machine with:
npx skills add gstbdstudio/swip --all
Confirm OpenCode can see swip, swip-commit, and swip-sec.
```

## Manual copy

```bash
mkdir -p .opencode/skills
git clone https://github.com/gstbdstudio/swip.git /tmp/swip
cp -r /tmp/swip/skills/swip /tmp/swip/skills/swip-commit /tmp/swip/skills/swip-sec .opencode/skills/
```

OpenCode also discovers `.claude/skills/` and `.agents/skills/` — see [docs/agents.md](../docs/agents.md).
