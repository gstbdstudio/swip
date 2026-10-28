# Example — complex mode

## Before (messy)

```text
benerin authnya yang sering error pas login, jangan rusak yang lain
```

## After (`/swip complex`)

```markdown
**Role:** Act as a senior backend engineer focused on authentication and session security.

**Goal:** Fix intermittent login failures so users can sign in reliably, without regressing other auth flows.

**Context:**
- Login sometimes fails (timing / race / token refresh unclear)
- Stack and auth library as found in the repo
- Related surfaces: signup, logout, password reset, session refresh

**Constraints:**
- Do not rewrite the whole auth system
- Keep existing API contracts unless a breaking change is required and called out
- Prefer root-cause fix over symptom patching
- Add or update tests for the failure path

**Done when:**
- Reproduced failure is fixed with a clear root cause
- Login succeeds consistently in the failing scenario
- Adjacent auth flows still work
- Tests cover the bug (or explain why not, with evidence)
```
