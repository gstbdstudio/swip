---
name: swip-sec
description: >
  Security assessment for the user's project (web app and/or mobile app):
  auto-detect stack, run a defensive checklist, report prioritized findings
  with remediation, then offer to fix high/critical items after confirmation.
  Use when the user runs /swip-sec, asks for a security assessment, security
  audit, security review, "cek keamanan", "audit keamanan", OWASP-style review,
  or wants web/mobile app hardening advice. Defensive and source-first only —
  no active exploitation of live systems.
---

# SWIP Sec — project security assessment

Help lazy builders get a useful security read on their **web** and/or **mobile** app without a full pentest circus. Stay casual in chat. Keep the **report** clear and serious.

## Scope (what this skill is)

- Source/config review of the **current project**
- Auto-detect relevant surfaces (web, API, Android, iOS, Flutter, React Native, etc.)
- Prioritized findings + concrete remediation suggestions
- Optional fixes **only after** the user confirms

## Out of scope (what this skill is not)

- Active exploitation of production/staging URLs
- Writing exploit PoCs or attack payloads against live systems
- Guaranteeing “fully secure”
- Replacing a professional pentest for high-stakes releases

If the user asks for live pentest / exploit proof, say this skill is assessment-only and point them to a dedicated pentest workflow/tooling.

## Workflow

### 1. Capture intent

Confirm (briefly, only if unclear):

- Target path (default: current workspace root)
- Focus: whole project vs named area (auth, payments, admin, …)
- Depth: default **standard** (checklist + evidence). If they say “cepat” / quick → lighter pass.

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

Load checklist details from [references/checklists.md](references/checklists.md) for the surfaces you found.

### 3. Assess (defensive)

For each relevant surface, check the items in the reference checklist. Prefer **evidence**:

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

### 4. Report

Present a single report in the user’s language (follow their input language):

```markdown
# Security assessment — <project>

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
```

Keep findings honest. Missing a best practice ≠ critical vulnerability.

### 5. Offer fixes (do not jump ahead)

After the report, ask what to do next:

1. Fix **critical/high** items now (recommended if any exist)
2. Fix a named finding only
3. Stop at the report

**Do not modify code until they confirm.** When fixing:

- Prefer the smallest effective change at the trust boundary
- Add/adjust tests when practical
- Re-check the finding after the change
- Do not silently expand into unrelated refactors

## Tone

- Chat: SWIP-casual, short, no fear-mongering
- Report: calm, evidence-first, actionable
