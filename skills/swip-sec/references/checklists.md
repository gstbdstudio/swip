# SWIP Sec checklists

Use only the sections that match the asset map. This is a practical review aid, not a claim of full OWASP coverage.

## Quick focus (for `/swip-sec quick`)

Prioritize these only; park other gaps under a short hardening backlog:

1. Secrets in repo / hardcoded client API keys with privilege
2. Auth & session weaknesses (cookies/tokens, reset, logout)
3. Broken access control / IDOR on sensitive reads/writes
4. Obvious injection sinks (SQL/command/XSS) on user input paths
5. Mobile: cleartext HTTP for auth/PII; tokens in plain storage
6. Android exported components / loose FileProvider; iOS ATS exceptions for auth hosts

## Web app / HTTP API

### Auth & session
- Password/reset/login flows: rate limiting, lockout or equivalent abuse controls
- Session/cookie flags: `HttpOnly`, `Secure`, `SameSite` where cookies are used
- Token storage: avoid long-lived secrets in `localStorage` for high-value sessions when httpOnly cookies are viable
- Logout invalidates server-side session / refresh tokens
- MFA/password reset tokens single-use and time-bounded

### Access control
- Authorization checks on every sensitive server action (not only UI hiding)
- Object-level auth (IDOR): user A cannot read/write user B’s resources by swapping IDs
- Role checks server-side for admin/staff routes
- Mass assignment: clients cannot set privileged fields (`role`, `isAdmin`, prices)

### Input / injection
- SQL/NoSQL/ORM: parameterized queries; no string-concatenated queries from user input
- Command/OS injection: no unsanitized shell from request data
- XSS: output encoding; careful with `dangerouslySetInnerHTML` / `v-html` / raw HTML
- SSRF: user-controlled URLs to internal networks blocked or allowlisted
- Path traversal on file download/upload

### Data & secrets
- No production secrets committed (`.env`, keys, tokens); `.env.example` has placeholders only
- Secrets loaded from env/secret manager, not hardcoded
- PII minimization; sensitive fields not logged
- Backup/export endpoints protected

### Transport & headers (web)
- HTTPS assumed in production config/docs
- Security headers where applicable: CSP, `X-Content-Type-Options`, `Referrer-Policy`, `Frame-Options`/`frame-ancestors`
- CORS: no `*` with credentials; reflect only trusted origins

### Dependencies & supply chain
- Lockfiles present; obvious abandoned/critical CVEs in direct deps called out when detectable
- CI does not print secrets; workflows use least privilege (`permissions:`)

### Uploads & files
- Type/size limits; content not executed from upload dir
- Auth on upload/download; signed URLs expire

## Mobile app (Android / iOS / Flutter / React Native / Expo)

### Storage & secrets
- No API keys/secrets hardcoded in the client binary when they grant privileged access
- Tokens in secure storage (Keychain / EncryptedSharedPreferences / secure store) — not plain SharedPreferences/`AsyncStorage` for refresh tokens when avoidable
- Logging does not print tokens, passwords, or full PII

### Transport
- TLS for all API calls; no cleartext HTTP for auth/PII (Android cleartext / ATS exceptions reviewed)
- Certificate pinning: note if absent (often **info/medium** depending on threat model) — do not demand pinning for every app

### Auth & session (client)
- Deep links / app links validated; tokens not accepted from untrusted query params without checks
- Biometric/local auth does not replace server auth for sensitive actions
- Session timeout / logout clears secure storage

### Platform misuse
- **Android:** exported Activities/Services/Receivers/Providers reviewed; `android:exported` intentional; FileProvider paths tight; WebView JS bridge hardened
- **iOS:** custom URL schemes; App Transport Security exceptions justified; Keychain accessibility flags sensible
- WebViews: JS bridges minimal; avoid loading untrusted universal URLs with privileged bridges

### Reverse engineering / tamper ( pragmatic )
- Debuggable/backdoor flags off in release builds
- ProGuard/R8 / bitcode/strip settings present for release when expected
- Root/jailbreak detection: optional note only — not a substitute for server controls

### Backend pairing
- Mobile clients call APIs that still enforce authz server-side
- Certificate/API keys in the app are treated as public; real power stays on the server

## Cross-cutting

- Admin/debug endpoints disabled or protected in production builds
- Error messages do not leak stack traces/secrets to end users
- Multi-tenant boundaries clear when the product is multi-tenant
- Payment/webhook handlers verify signatures
