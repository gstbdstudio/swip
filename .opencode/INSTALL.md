# Installing SWIP for OpenCode

Skills: `/swip` (prompt rewrite) and `/swip-commit` (commit message from git diff).

## Recommended — `npx skills`

```bash
npx skills add gstbdstudio/swip -a opencode -y
```

Global:

```bash
npx skills add gstbdstudio/swip -g -a opencode -y
```

Restart OpenCode (or start a new session), then run `/swip` or `/swip-commit`.

## Ask OpenCode to install it

Paste:

```text
Install the SWIP skill pack with:
npx skills add gstbdstudio/swip -a opencode -y
Then confirm OpenCode can see swip and swip-commit, and tell me how to run /swip and /swip-commit.
```

## Manual copy

```bash
mkdir -p .opencode/skills
git clone https://github.com/gstbdstudio/swip.git /tmp/swip
cp -r /tmp/swip/skills/swip /tmp/swip/skills/swip-commit .opencode/skills/
```

Or symlink if you develop locally:

```bash
mkdir -p .opencode/skills
ln -s /path/to/swip/skills/swip .opencode/skills/swip
ln -s /path/to/swip/skills/swip-commit .opencode/skills/swip-commit
```

OpenCode also discovers `.claude/skills/` and `.agents/skills/`.

## Verify

In a new OpenCode session, load `swip` / `swip-commit`, or run `/swip` and `/swip-commit`.
