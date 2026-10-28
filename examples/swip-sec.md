# Example — `/swip-sec`

## Typical run

```text
/swip-sec
```

or:

```text
cek keamanan project ini
```

Agent:

1. Maps stack (e.g. Next.js web + Expo mobile)
2. Reviews auth, access control, secrets, mobile storage/TLS, etc.
3. Prints a prioritized report
4. Asks: fix critical/high now?

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
Mau saya perbaiki temuan critical/high sekarang?
1) Ya, fix critical/high
2) Fix temuan tertentu saja
3) Cukup laporan
```
