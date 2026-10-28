# Example — `/swip-commit`

## Happy path

User has already edited files in a git repo, then runs `/swip-commit`.

Agent:

1. Confirms `git rev-parse --is-inside-work-tree` succeeds
2. Reads `git status` + diffs
3. Proposes a message, e.g.

```text
feat(auth): fix intermittent login race on token refresh

Stabilize session refresh so login no longer fails under concurrent
tab loads. Keep existing auth API contracts.
```

4. Waits for confirmation before `git commit`

## No git

```text
/swip-commit
```

Agent reply (ID):

> Project ini bukan git repository (tidak ada `.git`). `/swip-commit` butuh git. Jalankan `git init` kalau mau mulai, atau buka folder yang sudah pakai git.

Agent reply (EN):

> This project is not a git repository (no `.git` here). `/swip-commit` needs git. Initialize with `git init` if you want, or open a folder that already has git.
