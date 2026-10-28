# Example — `/swip-sec`

## Modes

| Command | Depth |
|---------|--------|
| `/swip-sec` or `/swip-sec standard` | Fuller checklist for detected surfaces (default) |
| `/swip-sec quick` | Fast pass: secrets, auth, access control, mobile storage/TLS |

Also triggered by: `cek keamanan`, `audit keamanan`, “security assessment”.

## Typical run

```text
/swip-sec
```

Agent:

1. Maps stack (e.g. Next.js web + Expo mobile)
2. Reviews checklists for detected surfaces
3. Prints a prioritized report **and** writes `SECURITY-REPORT.md` at the project root
4. Asks: fix critical/high now?

## Quick run

```text
/swip-sec quick
```

Same flow, narrower checklist. Report header includes `Mode: quick` and a coverage note recommending `/swip-sec standard` later.

## Sample finding shape

```markdown
### [HIGH] IDOR on GET /api/orders/:id
- **Impact:** Any logged-in user can read another user’s order by changing the id.
- **Evidence:** `app/api/orders/[id]/route.ts` loads by id without `session.userId` check.
- **Remediation:** Scope the query to the authenticated user (or enforce ownership after fetch before return).
- **Verify:** Request another user’s order id → expect 404/403.
```

## After the report

```text
Laporan tersimpan di SECURITY-REPORT.md

Mau saya perbaiki temuan critical/high sekarang?
1) Ya, fix critical/high
2) Fix temuan tertentu saja
3) Cukup laporan
```
