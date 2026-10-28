# Installing SWIP for OpenCode

## Recommended — `npx skills`

```bash
npx skills add gstbdstudio/swip --skill swip -a opencode -y
```

Global:

```bash
npx skills add gstbdstudio/swip --skill swip -g -a opencode -y
```

Restart OpenCode (or start a new session), then run `/swip`.

## Ask OpenCode to install it

Paste:

```text
Install skill SWIP with:
npx skills add gstbdstudio/swip --skill swip -a opencode -y
Then confirm OpenCode can see it and tell me how to run /swip.
```

## Manual copy

```bash
mkdir -p .opencode/skills
git clone https://github.com/gstbdstudio/swip.git /tmp/swip
cp -r /tmp/swip/skills/swip .opencode/skills/swip
```

Or symlink the whole checkout if you develop the skill locally:

```bash
mkdir -p .opencode/skills
ln -s /path/to/swip/skills/swip .opencode/skills/swip
```

OpenCode also discovers `.claude/skills/` and `.agents/skills/` — so a Claude Code or shared agents install may already expose SWIP.

## Verify

In a new OpenCode session, ask it to load skill `swip`, or run `/swip` with a messy prompt.
