---
name: swip-sec
description: >
  Security assessment for the user's project (web app and/or mobile app):
  auto-detect stack, run a defensive checklist, report prioritized findings
  with remediation, write SECURITY-REPORT.md, then offer to fix high/critical
  items after confirmation. Use when the user runs /swip-sec, /swip-sec quick,
  /swip-sec standard, asks for a security assessment, security audit, security
  review, "cek keamanan", "audit keamanan", OWASP-style review, or web/mobile
  hardening advice. Modes: quick (fast pass) or standard (default, fuller
  checklist). Defensive and source-first only — no active exploitation of live
  systems.
---

# SWIP Sec — project security assessment

Help lazy builders get a useful security read on their **web** and/or **mobile** app without a full pentest circus. Stay casual in chat. Keep the **report** clear and serious.

When chatting in Indonesian, use **gue** for first person — never **saya** or **aku**.

## Modes

| Mode | Invoke | Depth |
|------|--------|--------|
| **standard** (default) | `/swip-sec`, `/swip-sec standard` | Full relevant checklists + evidence for detected surfaces |
| **quick** | `/swip-sec quick`, or user says “cepat” / “quick” | Fast pass: secrets, auth/session, access control (IDOR-ish), mobile insecure storage/cleartext — top risks only |

If the user does not name a mode, use **standard**.

**Quick rules:**

- Cap chat findings detail; still be accurate
- Prefer critical/high candidates; fold obvious lows into a short “hardening backlog” bullet list
- Still write `SECURITY-REPORT.md` (mark `Mode: quick`)
- Say explicitly that quick is partial coverage

## Scope (what this skill is)

- Source/config review of the **current project**
- Auto-detect relevant surfaces (web, API, Android, iOS, Flutter, React Native, etc.)
- Prioritized findings + concrete remediation suggestions
- Persist report to **`SECURITY-REPORT.md`** at the assessment target root
- Optional fixes **only after** the user confirms

## Out of scope (what this skill is not)

- Active exploitation of production/staging URLs
- Writing exploit PoCs or attack payloads against live systems
- Guaranteeing “fully secure”
- Replacing a professional pentest for high-stakes releases

If the user asks for live pentest / exploit proof, say this skill is assessment-only and point them to a dedicated pentest workflow/tooling.

## Workflow

### 1. Capture intent

Note the mode (**quick** | **standard**). Confirm only if unclear:

- Target path (default: current workspace root)
- Focus: whole project vs named area (auth, payments, admin, …)

### 2. Recon — auto-detect stack

Inspect the repo (read-only first):

- Manifests: `package.json`, `pnpm-lock.yaml`, `requirements.txt`, `go.mod`, `Cargo.toml`, `pom.xml`, `build.gradle*`, `Podfile`, `pubspec.yaml`, `app.json` / `app.config.*`, `AndroidManifest.xml`, `Info.plist`
- Frameworks: Next.js, Remix, Rails, Django, Laravel, Spring, Express/Fastify, Nest, Flutter, React Native, Expo, native Android/iOS
- Deploy hints: Dockerfiles, nginx configs, CI workflows, `.env.example`

Build a short **Asset map**:

| Surface | Detected? | Evidence (paths) |
|---------|-----------|------------------|
| Web UI | yes/no | … |
| HTTP API | yes/no | … |
| Auth/session | yes/no | … |
| Mobile app | yes/no | … |
| Backend for mobile | yes/no | … |
| Infra/CI secrets | yes/no | … |

If almost nothing is detectable, ask 1–3 questions, then continue with what you have.

Load checklist details from [references/checklists.md](references/checklists.md) for the surfaces you found. In **quick** mode, prioritize the “Quick focus” subset in that file (or equivalent: secrets, auth, access control, mobile storage/TLS).

### 3. Assess (defensive)

For each relevant surface, check the items appropriate to the mode. Prefer **evidence**:

- File paths + short snippets / config keys
- Missing controls that the code/config should have
- Dependency or secret smells visible in-repo

Classify each finding:

| Severity | Use when |
|----------|----------|
| **critical** | Unauth RCE, auth bypass, arbitrary account takeover, wide secret leak in repo |
| **high** | Broken access control with real impact, stored XSS affecting others, SQLi/command injection reachable, mobile exported component leading to data theft |
| **medium** | Real weakness with limited blast radius or uncommon preconditions |
| **low** | Hardening gap, verbose errors, missing best-practice headers |
| **info** | Notes, defense-in-depth, “verify in deploy” |

Also keep a **Needs validation** list for things that depend on deploy/runtime you cannot see (WAF, cloud IAM, store signing, production env).

**Do not** run attacks against remote hosts. Local static review and reading configs/tests is enough for this skill.

### 4. Report (chat + file)

Present the report in the user’s language (follow their input language), then **write the same content** to:

```text
<target-root>/SECURITY-REPORT.md
```

If `SECURITY-REPORT.md` already exists, overwrite it with this run’s report (mention that in chat). Do not commit the file unless the user asks.

Report template:

```markdown
# Security assessment — <project>

**Mode:** quick | standard
**Scope:** …
**Stack detected:** …
**Date/ref:** <commit or “dirty worktree”>

## Summary
- critical: N | high: N | medium: N | low: N | info: N

## Findings (priority order)
### [SEVERITY] Short title
- **Impact:** …
- **Evidence:** `path` …
- **Remediation:** concrete steps / smallest fix
- **Verify:** how to confirm the fix

## Needs validation
- …

## Positive notes
- What already looks solid (short)

## Coverage note
- For **quick**: state that this was a fast pass and recommend `/swip-sec standard` for fuller coverage.
```

Keep findings honest. Missing a best practice ≠ critical vulnerability.

After writing the file, tell the user the path: `SECURITY-REPORT.md`.

### 5. Offer fixes (do not jump ahead)

After the report, ask what to do next:

1. Fix **critical/high** items now (recommended if any exist)
2. Fix a named finding only
3. Stop at the report (file already saved)

**Do not modify application code until they confirm.** When fixing:

- Prefer the smallest effective change at the trust boundary
- Add/adjust tests when practical
- Re-check the finding after the change
- Optionally append a short “Remediation log” section to `SECURITY-REPORT.md` for fixed items
- Do not silently expand into unrelated refactors

## Tone

- Chat: SWIP-casual, short, no fear-mongering
- Indonesian chat: **gue** (not saya/aku)
- Report / `SECURITY-REPORT.md`: calm, evidence-first, actionable (report body need not force “gue”)
