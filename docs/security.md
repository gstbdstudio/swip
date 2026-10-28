# Security & trust

SWIP is a pack of **Agent Skills** (`SKILL.md` instructions). Installing it gives your coding agent guidance it may follow with the same permissions as a normal chat session (read files, run commands, edit code). Treat skill installs like you treat third-party automation.

## Official source

| | |
|--|--|
| **Canonical repo** | [https://github.com/gstbdstudio/swip](https://github.com/gstbdstudio/swip) |
| **Install** | `npx skills add gstbdstudio/swip --all` |
| **Owner** | [`gstbdstudio`](https://github.com/gstbdstudio) |

Do **not** install lookalike repos, random forks, or renamed copies unless you have reviewed them yourself.

## What can go wrong

Skills are mostly markdown instructions, not a silent binary implant. Harm happens if:

1. Someone **compromises this GitHub repo/account** and publishes malicious instructions, then users **update/reinstall**
2. Users install a **fake / typosquat** source
3. The agent **follows** bad instructions (exfiltrate secrets, skip confirmations, destructive shell)

SWIP’s published skills ask for confirmation before commits and code fixes. A hijacked update could remove those guards.

## Verify before you trust an install or update

1. Confirm the source is exactly `gstbdstudio/swip`
2. Open and skim:
   - `skills/swip/SKILL.md`
   - `skills/swip-commit/SKILL.md`
   - `skills/swip-sec/SKILL.md`
3. Reject unexpected asks: send secrets outbound, `curl | bash`, force-push, commit without asking, disable safety checks
4. Prefer reviewing the diff when you run `npx skills update` (or re-install)

Local smoke checks (structure only — not a malware scan):

```bash
bash scripts/smoke-test.sh
```

## Advice for users

- Install only from the official source above
- Limit agent access to production secrets / cloud credentials when you can
- Watch tool calls the first times you use `/swip`, `/swip-commit`, `/swip-sec`
- Add `SECURITY-REPORT.md` to `.gitignore` if that file must stay private
- Pin or avoid blind auto-updates if your threat model is strict

## Advice for maintainers of this repo

- Keep GitHub **2FA** (prefer passkeys) on `gstbdstudio`
- Protect `main` (PR required, no force-push)
- Never commit tokens or `.env` files
- Review dependency/Actions changes carefully when CI billing works again
- Announce breaking trust-relevant changes in `CHANGELOG.md`

## Reporting a problem

If you believe this repo or a distributed copy is compromised or malicious:

1. Open a GitHub issue on [gstbdstudio/swip](https://github.com/gstbdstudio/swip/issues) with **no secrets** in the report, **or**
2. Contact the owner via GitHub if the repo itself looks taken over

## ID (ringkas)

Skill ini bisa disalahgunakan kalau sumber install-nya palsu atau akun/repo resmi dibajak, lalu agent nurutin instruksi jahat. Pasang cuma dari `gstbdstudio/swip`, baca `SKILL.md` abis update, dan tolak aksi aneh. Maintainer: jaga 2FA sama proteksi branch `main`.
